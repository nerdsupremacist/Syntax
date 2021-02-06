
import Foundation
import SyntaxTree

struct ExpressionScanResult {
    let match: ExpressionMatch
    let state: ScannerState
}

private protocol ScannerStateStorage: class {
    var allowErrorHandling: Bool { get }

    var lastDiagnosticError: DiagnosticError? { get }

    func effective() -> ScannerStateStorage

    func store<T>(value: T)
    func store(error: DiagnosticError)
    func pop<T>(of type: T.Type) throws -> T?
    func preventRecursion(id: UUID) throws

    func parse(_ state: ScannerState,
               using parser: InternalParser,
               with scanner: Scanner,
               memoizationStorage: MemoizationStorage) throws

    func take(expression: NSRegularExpression,
              in text: String,
              for state: ScannerState) throws -> ExpressionScanResult

    func begin(_ state: ScannerState) -> ScannerState
    func rollback(_ state: ScannerState) -> ScannerState?
    func commit(_ state: ScannerState) throws -> ScannerState?

    func prefix(_ length: Int, in state: ScannerState) throws -> Substring?

    func nodeRange(for state: ScannerState) -> Range<Int>
}

extension ScannerStateStorage {

    func effective() -> ScannerStateStorage {
        return self
    }

}

final class ScannerState {
    enum StateKind {
        case inPlace
        case annotatingWhatItFinds
    }

    fileprivate var text: String
    fileprivate var lineColumnIndex: LineColumnIndex
    fileprivate(set) var range: Range<String.Index>
    fileprivate let parent: ScannerState?
    fileprivate(set) var node: Node
    fileprivate let storage: ScannerStateStorage

    var allowErrorHandling: Bool {
        return storage.allowErrorHandling
    }

    var lastDiagnosticError: DiagnosticError? {
        return storage.lastDiagnosticError
    }

    init(text: String) {
        self.text = text
        self.range = text.startIndex..<text.endIndex
        self.node = Node(start: text.startIndex, parent: nil)
        self.parent = nil
        self.storage = InPlaceStorage()
        self.lineColumnIndex = LineColumnIndex(string: text)
    }

    fileprivate init(range: Range<String.Index>, parent: ScannerState, storage: ScannerStateStorage) {
        self.text = parent.text
        self.lineColumnIndex = parent.lineColumnIndex
        self.range = range
        self.node = Node(start: range.lowerBound, parent: nil)
        self.parent = parent
        self.storage = storage
    }

    func parse(using parser: InternalParser,
               with scanner: Scanner,
               memoizationStorage: MemoizationStorage) throws {

        try storage.parse(self, using: parser, with: scanner, memoizationStorage: memoizationStorage)
    }

    func enterNode() {
        node = Node(start: range.lowerBound, parent: node)
    }

    func exitNode(in text: String, lineColumnIndex: LineColumnIndex) {
        guard let parent = node.parent else { return }

        let nodeRange = storage.nodeRange(for: self)
        let syntaxTree = MutableSyntaxTree(range: nodeRange,
                                           location: lineColumnIndex[nodeRange.lowerBound]!..<lineColumnIndex[nodeRange.upperBound]!,
                                           annotations: [:],
                                           children: node.children)

        parent.children.append(syntaxTree)
        node = parent
    }

    func removeChildrenOfNode() {
        node.children = []
    }

    func configureNode(kind: Kind) {
        node.children.last?.kind = kind
    }

    func configureNode(annotations: [String : Encodable]) {
        node.children.last?.add(annotations: annotations)
    }

    func pruneNode(strategy: Kind.CombinationStrategy) {
        node.children.last?.prune(using: strategy)
    }

    func store<T>(value: T) {
        storage.store(value: value)
    }

    func store(error: DiagnosticError) {
        storage.store(error: error)
    }

    func pop<T>(of type: T.Type) throws -> T? {
        return try storage.pop(of: type)
    }

    func preventRecursion(id: UUID) throws {
        try storage.preventRecursion(id: id)
    }

    func take(expression: NSRegularExpression,
              in text: String) throws -> ExpressionScanResult {

        return try storage.take(expression: expression, in: text, for: self)
    }

    func begin() -> ScannerState {
        return storage.begin(self)
    }

    func beginScanning<T>(in range: Range<String.Index>, for type: T.Type) -> ScannerState {
        return ScannerState(range: range, parent: self, storage: ScanningStorage<T>())
    }

    func rollback() -> ScannerState? {
        return storage.rollback(self)
    }

    func commit() throws -> ScannerState? {
        return try storage.commit(self)
    }

    func prefix(_ length: Int) throws -> Substring? {
        return try storage.prefix(length, in: self)
    }


}

// MARK: - Diagnostics Helpers

extension ScannerState {

    func location(for index: String.Index) -> Location {
        return lineColumnIndex[text.distance(from: text.startIndex, to: index)]!
    }

}

extension ScannerState {

    func error(reason: ScannerError.Reason) -> ScannerError {
        return ScannerError(index: range.lowerBound,
                            location: location(for: range.lowerBound),
                            reason: reason)
    }

}

private final class InPlaceStorage: ScannerStateStorage {
    var allowErrorHandling: Bool {
        return true
    }

    var values: Stack = Stack()
    var ids: Set<UUID>
    var lastDiagnosticError: DiagnosticError? = nil

    init() {
        ids = []
    }

    private init(ids: Set<UUID>) {
        self.ids = ids
    }

    func parse(_ state: ScannerState, using parser: InternalParser, with scanner: Scanner, memoizationStorage: MemoizationStorage) throws {
        let start = state.range.lowerBound
        let key = MemoizationKey(id: parser.id, start: start)
        if let memoized = memoizationStorage[key] {
            state.range = memoized.range
            state.node = memoized.node
            values.append(contentsOf: memoized.values)
            ids = memoized.ids
            lastDiagnosticError = memoized.lastDiagnosticError
            return
        }

        let currentStack = values

        try parser.parse(using: scanner)
        var values = self.values
        values.remove(from: currentStack)
        let memoized = MemoizedState(range: state.range,
                                          node: state.node,
                                          values: values,
                                          ids: ids,
                                          lastDiagnosticError: state.lastDiagnosticError)

        memoizationStorage[key] = memoized
    }

    func store<T>(value: T) {
        values.append(value)
    }

    func store(error: DiagnosticError) {
        switch lastDiagnosticError {
        case .some(let lastError) where error.location > lastError.location:
            lastDiagnosticError = error
        case .some:
            break
        case .none:
            lastDiagnosticError = error
        }
    }

    func pop<T>(of type: T.Type) throws -> T? {
        return values.pop(of: type)
    }

    func preventRecursion(id: UUID) throws {
        guard !ids.contains(id) else {
            throw ParserError.failedDueToLeftHandSideRecursionDetected(id: id)
        }
        ids.formUnion([id])
    }

    func take(expression: NSRegularExpression, in text: String, for state: ScannerState) throws -> ExpressionScanResult {
        let rangeToLookAt = NSRange(state.range, in: text)
        guard let match = expression.firstMatch(in: text, options: .anchored, range: rangeToLookAt) else {
            throw state.error(reason: .failedToMatch(expression))
        }

        let result = ExpressionMatch(source: text, match: match)
        if result.range.upperBound > state.range.lowerBound {
            ids = []
        }
        state.range = result.range.upperBound..<state.range.upperBound

        if let lastError = state.lastDiagnosticError,
           lastError.location < state.location(for: result.range.upperBound) {

            lastDiagnosticError = nil
        }

        return ExpressionScanResult(match: result, state: state)
    }

    func begin(_ state: ScannerState) -> ScannerState {
        return ScannerState(range: state.range, parent: state, storage: InPlaceStorage(ids: ids))
    }

    func rollback(_ state: ScannerState) -> ScannerState? {
        return state.parent
    }

    func commit(_ state: ScannerState) throws -> ScannerState? {
        guard let parent = state.parent else { return nil }

        switch parent.storage.effective() {

        case let storage as InPlaceStorage:
            parent.range = state.range
            storage.values.append(contentsOf: values)
            storage.ids = ids
            storage.lastDiagnosticError = lastDiagnosticError

            if parent.node.start >= state.node.originalStart && state.node.originalStart < state.node.start {
                parent.node.update(from: state.node.originalStart, to: state.node.start)
            }

            parent.node.children.append(contentsOf: state.node.children)

        case let storage as ScanningStorageProtocol:
            switch values.count {
            case 0:
                try storage.add(value: (), until: state.range.lowerBound, from: state)
            case 1:
                try storage.add(value: values.pop(of: Any.self)!, until: state.range.lowerBound, from: state)
            default:
                fatalError("Commiting an inplace storage that returns multiple values in the stack to a scanning storage")
            }

            parent.node.children.append(contentsOf: state.node.children)

        default:
            break

        }

        return parent
    }

    func prefix(_ length: Int, in state: ScannerState) throws -> Substring? {
        guard length > 0 else { return "" }

        let pattern = "\\s*((.|\\n){0,\(length)})"
        let expression = try NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)

        let rangeToLookAt = NSRange(state.range, in: state.text)
        guard let match = expression.firstMatch(in: state.text, options: .anchored, range: rangeToLookAt) else {
            throw state.error(reason: .failedToMatch(expression))
        }

        let range = Range(match.range(at: 1), in: state.text)!
        return state.text[range]
    }

    func nodeRange(for state: ScannerState) -> Range<Int> {
        let start = state.text.distance(from: state.text.startIndex, to: state.node.start)
        let end = state.text.distance(from: state.text.startIndex, to: state.range.lowerBound)
        return start..<end
    }
}

private protocol ScanningStorageProtocol {
    func add(value: Any, until index: String.Index, from state: ScannerState) throws
}

private final class ScanningStorage<T>: ScannerStateStorage, ScanningStorageProtocol {
    typealias Annotation = AnnotatedString<T>.Annotation
    private let fromParent: [Range<String.Index>]
    var annotations: [Annotation] = []
    var ids: Set<UUID>
    var parent: ScanningStorage<T>?

    var allowErrorHandling: Bool {
        return false
    }

    var lastDiagnosticError: DiagnosticError? {
        return nil
    }

    var rangeMatchStart: String.Index? = nil {
        didSet {
            parent?.rangeMatchStart = rangeMatchStart
        }
    }

    init() {
        fromParent = []
        ids = []
    }

    init(parent: ScanningStorage<T>) {
        self.parent = parent
        fromParent = parent.annotations.map(\.range) + parent.fromParent
        ids = parent.ids
    }

    func parse(_ state: ScannerState, using parser: InternalParser, with scanner: Scanner, memoizationStorage: MemoizationStorage) throws {
        try parser.parse(using: scanner)
    }

    func store<T>(value: T) {
        // No-op
    }

    func store(error: DiagnosticError) {
        // No-op
    }

    func pop<T>(of type: T.Type) throws -> T? {
        return annotations.last?.value as? T
    }

    func preventRecursion(id: UUID) throws {
        guard !ids.contains(id) else {
            throw ParserError.failedDueToLeftHandSideRecursionDetected(id: id)
        }
        ids.formUnion([id])
    }

    func take(expression: NSRegularExpression, in text: String, for state: ScannerState) throws -> ExpressionScanResult {
        let rangeToLookAt = NSRange(state.range, in: text)
        let matches = expression.matches(in: text, range: rangeToLookAt).map { ExpressionMatch(source: text, match: $0) }
        guard let result = matches.first(where: { match in fromParent.allSatisfy { !$0.overlaps(match.range) } && annotations.allSatisfy { !$0.range.overlaps(match.range) } }) else {
            throw state.error(reason: .failedToMatch(expression))
        }

        // Upon a match start with in place storage
        let nextState = ScannerState(range: result.range.lowerBound..<state.range.upperBound, parent: state, storage: InPlaceStorage())
        nextState.range = result.range.upperBound..<state.range.upperBound

        let (firstNode, rest) = state.node.backToFirst()

        state.node = firstNode
        if let rest = rest {
            rest.update(from: state.range.lowerBound, to: result.range.lowerBound)
            nextState.node = rest
        }

        rangeMatchStart = result.range.lowerBound
        return ExpressionScanResult(match: result, state: nextState)
    }

    func begin(_ state: ScannerState) -> ScannerState {
        return ScannerState(range: state.range, parent: state, storage: StackedScanningStateStorage<T>(parent: self))
    }

    func rollback(_ state: ScannerState) -> ScannerState? {
        return state.parent
    }

    func commit(_ state: ScannerState) -> ScannerState? {
        guard let parent = state.parent else { return nil }

        switch parent.storage.effective() {
        case let storage as InPlaceStorage:
            parent.range = state.range.upperBound..<parent.range.upperBound
            storage.values.append(AnnotatedString(text: state.text[state.range], annotations: annotations.sorted { $0.range.lowerBound < $1.range.lowerBound }))
            storage.ids = []

            if parent.node.start >= state.node.originalStart && state.node.originalStart < state.node.start {
                parent.node.update(from: state.node.originalStart, to: state.node.start)
            }

        case let storage as ScanningStorage<T>:
            storage.annotations.append(contentsOf: annotations)
            storage.ids = ids

        default:
            break
        }

        parent.node.children.append(contentsOf: state.node.children)
        return parent
    }

    func add(value: Any, until index: String.Index, from state: ScannerState) throws {
        guard let start = rangeMatchStart else { throw state.error(reason: .annotatedValueDoesNotHaveAStartingIndex(value)) }
        guard let casted = value as? T else { throw state.error(reason: .annotatedValueDoeNotMatchExpectedType(value, expected: T.self)) }

        ids = []
        rangeMatchStart = nil
        annotations.append(AnnotatedString<T>.Annotation(range: start..<index, value: casted))
    }

    func prefix(_ length: Int, in state: ScannerState) throws -> Substring? {
        return nil
    }

    func nodeRange(for state: ScannerState) -> Range<Int> {
        guard !state.node.children.isEmpty else {
            let start = state.text.distance(from: state.text.startIndex, to: state.range.lowerBound)
            let end = state.text.distance(from: state.text.startIndex, to: state.range.upperBound)
            return start..<end
        }
        let min = state.node.children.map(\.range.lowerBound).min()!
        let max = state.node.children.map(\.range.upperBound).max()!
        return min..<max
    }
}

private class StackedScanningStateStorage<T>: ScannerStateStorage {
    let scanning: ScanningStorage<T>
    let inplace: InPlaceStorage

    private var isInPlace = false

    var current: ScannerStateStorage {
        if isInPlace {
            return inplace
        } else {
            return scanning
        }
    }

    var allowErrorHandling: Bool {
        return current.allowErrorHandling
    }

    var lastDiagnosticError: DiagnosticError? {
        return current.lastDiagnosticError
    }

    init(parent: ScanningStorage<T>) {
        self.scanning = ScanningStorage(parent: parent)
        self.inplace = InPlaceStorage()
    }

    func store<T>(value: T) {
        current.store(value: value)
    }

    func store(error: DiagnosticError) {
        current.store(error: error)
    }

    func pop<T>(of type: T.Type) throws -> T? {
        return try current.pop(of: type)
    }

    func preventRecursion(id: UUID) throws {
        return try current.preventRecursion(id: id)
    }

    func parse(_ state: ScannerState, using parser: InternalParser, with scanner: Scanner, memoizationStorage: MemoizationStorage) throws {
        return try current.parse(state, using: parser, with: scanner, memoizationStorage: memoizationStorage)
    }

    func take(expression: NSRegularExpression, in text: String, for state: ScannerState) throws -> ExpressionScanResult {
        if isInPlace {
            return try current.take(expression: expression, in: text, for: state)
        }

        let result = try current.take(expression: expression, in: text, for: state)

        var state: ScannerState? = state
        while let storage = state?.storage as? StackedScanningStateStorage<T> {
            storage.isInPlace = true
            state = state?.parent
        }

        return result
    }

    func begin(_ state: ScannerState) -> ScannerState {
        return current.begin(state)
    }

    func rollback(_ state: ScannerState) -> ScannerState? {
        return current.rollback(state)
    }

    func commit(_ state: ScannerState) throws -> ScannerState? {
        return try current.commit(state)
    }

    func prefix(_ length: Int, in state: ScannerState) throws -> Substring? {
        return try current.prefix(length, in: state)
    }

    func nodeRange(for state: ScannerState) -> Range<Int> {
        return current.nodeRange(for: state)
    }

    func effective() -> ScannerStateStorage {
        return current
    }
}

extension Node {
    fileprivate func backToFirst() -> (first: Node, rest: Node?) {
        guard let parent = parent else { return (self, nil) }
        switch parent.backToFirst() {
        case (let first, .none):
            let newNode = Node(start: start, parent: nil)
            newNode.children.append(contentsOf: children)
            return (first, newNode)
        case (let first, .some(let parent)):
            let newNode = Node(start: start, parent: parent)
            newNode.children.append(contentsOf: children)
            return (first, newNode)
        }
    }
}
