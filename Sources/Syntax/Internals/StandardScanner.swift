
import Foundation
import SyntaxTree

class StandardScanner: Scanner {
    private class Node {
        let originalStart: String.Index
        var start: String.Index
        var parent: Node? = nil
        var children: [MutableSyntaxTree] = []

        init(start: String.Index, parent: Node? = nil) {
            self.originalStart = start
            self.start = start
            self.parent = parent
        }

        func update(from previous: String.Index, to new: String.Index) {
            if start >= previous, start < new {
                start = new
                parent?.update(from: previous, to: new)
            }
        }
    }

    private class Storage {
        var index: String.Index
        let parent: Storage?
        var node: Node
        var values: [Any] = []
        var ids: Set<UUID>
        var lastDiagnosticError: DiagnosticError? = nil

        init(index: String.Index, parent: Storage?) {
            self.index = index
            self.node = Node(start: index, parent: nil)
            self.ids = parent?.ids ?? []
            self.parent = parent
            self.lastDiagnosticError = parent?.lastDiagnosticError
        }
    }

    private struct MemoizationKey: Hashable {
        let hashable: AnyHashable
        let start: String.Index
    }

    private struct Memoized {
        var index: String.Index
        var node: Node
        var values: [Any] = []
        var ids: Set<UUID>
        var lastDiagnosticError: DiagnosticError? = nil
    }

    private let text: String
    private let lineColumnIndex: LineColumnIndex
    private var storage: Storage
    private var regularExpressions: [String : NSRegularExpression] = [:]
    private var memoized: [MemoizationKey : Memoized] = [:]

    private let errorHandlers: [ScannerErrorHandler]

    var index: String.Index {
        return storage.index
    }

    var location: Location {
        return location(for: index)
    }

    init(text: String, errorHandlers: [ScannerErrorHandler]) {
        self.text = text
        self.lineColumnIndex = LineColumnIndex(string: text)
        self.storage = Storage(index: text.startIndex, parent: nil)
        self.errorHandlers = errorHandlers
    }

    func prefix(_ length: Int) throws -> Substring {
        guard length > 0 else { return "" }
        
        let pattern = "\\s*((.|\\n){0,\(length)})"
        let expression: NSRegularExpression
        if let stored = regularExpressions[pattern] {
            expression = stored
        } else {
            expression = try NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
            regularExpressions[pattern] = expression
        }

        let rangeToLookAt = NSRange(storage.index..., in: text)
        guard let match = expression.firstMatch(in: text, options: .anchored, range: rangeToLookAt) else {
            throw error(reason: .failedToMatch(expression))
        }

        let range = Range(match.range(at: 1), in: text)!
        return text[range]
    }

    func preventRecursion(id: UUID) throws {
        guard !storage.ids.contains(id) else {
            throw ParserError.failedDueToLeftHandSideRecursionDetected(id: id)
        }
        storage.ids.formUnion([id])
    }

    func begin() {
        storage = Storage(index: storage.index, parent: storage)
    }

    func commit() throws {
        guard let parent = storage.parent else { return }
        parent.index = storage.index
        parent.values = parent.values + storage.values
        parent.ids = storage.ids
        parent.lastDiagnosticError = storage.lastDiagnosticError

        if parent.node.start >= storage.node.originalStart && storage.node.originalStart < storage.node.start {
            parent.node.update(from: storage.node.originalStart, to: storage.node.start)
        }

        parent.node.children.append(contentsOf: storage.node.children)
        storage = parent
    }

    func rollback() throws {
        guard let parent = storage.parent else { return }
        storage = parent
    }

    func enterNode() {
        storage.node = Node(start: storage.index, parent: storage.node)
    }

    func exitNode() {
        guard let parent = storage.node.parent else { return }

        let startIndex = storage.node.start
        let endIndex = storage.index
        let startOffset = text.distance(from: text.startIndex, to: startIndex)
        let endOffset = text.distance(from: text.startIndex, to: endIndex)

        let syntaxTree = MutableSyntaxTree(range: startOffset..<endOffset,
                                           location: lineColumnIndex[startOffset]!..<lineColumnIndex[endOffset]!,
                                           annotations: [:],
                                           children: storage.node.children)

        parent.children.append(syntaxTree)
        storage.node = parent
    }

    func removeChildrenOfNode() {
        storage.node.children = []
    }

    func locationOfNode() -> Range<Location> {
        return location(for: storage.node.start)..<location(for: storage.index)
    }

    func configureNode(kind: Kind) {
        storage.node.children.last?.kind = kind
    }

    func configureNode(annotations: [String : Encodable]) {
        storage.node.children.last?.add(annotations: annotations)
    }

    func pruneNode(strategy: Kind.CombinationStrategy) {
        storage.node.children.last?.prune(using: strategy)
    }

    func take(pattern: String) throws -> ExpressionMatch {
        return try take(pattern: pattern, allowErrorHandling: true)
    }

    func pop<T>(of type: T.Type = T.self) throws -> T {
        guard let value = storage.values.popLast() else {
            throw error(reason: .attemptedToPopValueFromEmptyList(type))
        }

        if let value = value as? T {
            return value
        } else {
            storage.values.append(value)
            throw error(reason: .poppedValueDidNotMatchExpectedValue(value, expected: type))
        }
    }

    func store<T>(value: T) {
        storage.values.append(value)
    }

    func store(error: DiagnosticError) {
        switch storage.lastDiagnosticError {
        case .some(let lastError) where error.location > lastError.location:
            storage.lastDiagnosticError = error
        case .some:
            break
        case .none:
            storage.lastDiagnosticError = error
        }
    }

    func parse(using parser: InternalParser) throws {
        let start = storage.index
        let key = MemoizationKey(hashable: parser.hashable, start: start)
        if let memoized = self.memoized[key] {
            storage.index = memoized.index
            storage.node = memoized.node
            storage.values = storage.values + memoized.values
            storage.ids = memoized.ids
            storage.lastDiagnosticError = memoized.lastDiagnosticError
            return
        }

        let index = storage.values.endIndex

        try parser.parse(using: self)
        let memoized = Memoized(index: storage.index,
                                node: storage.node,
                                values: Array(storage.values[index...]),
                                ids: storage.ids,
                                lastDiagnosticError: storage.lastDiagnosticError)

        self.memoized[key] = memoized
    }
}

extension StandardScanner {

    func syntaxTree() -> SyntaxTree {
        let startIndex = storage.node.start
        let endIndex = storage.index
        let startOffset = text.distance(from: text.startIndex, to: startIndex)
        let endOffset = text.distance(from: text.startIndex, to: endIndex)

        let syntaxTree = MutableSyntaxTree(range: startOffset..<endOffset,
                                           location: lineColumnIndex[startOffset]!..<lineColumnIndex[endOffset]!,
                                           annotations: [:],
                                           children: storage.node.children)

        syntaxTree.prune(using: .separate)
        return syntaxTree.build()
    }

}

extension StandardScanner {

    func checkIsEmpty() throws {
        do {
            try _checkIsEmpty()
            return
        } catch {
            for errorHandler in errorHandlers {
                do {
                    try errorHandler.scannerIsNotAtTheEnd(self)
                    try _checkIsEmpty()
                    return
                } catch { }
            }
            
            throw error
        }
    }

    private func _checkIsEmpty() throws {
        if let lastError = storage.lastDiagnosticError {
            throw lastError
        }

        if storage.index < text.endIndex {
            let token: Substring
            do {
                let expression = try NSRegularExpression(pattern: "\\S+")
                let rangeToLookAt = NSRange(storage.index..., in: text)
                if let match = expression.firstMatch(in: text, range: rangeToLookAt) {
                    let range = Range(match.range, in: text)!
                    token = text[range]
                } else {
                    token = text[storage.index...]
                }
            } catch {
                token = text[storage.index...]
            }

            throw error(reason: .unexpectedToken(String(token)))
        }
    }

}

extension StandardScanner {

    fileprivate func take(pattern: String, allowErrorHandling: Bool) throws -> ExpressionMatch {
        let expression: NSRegularExpression
        if let stored = regularExpressions[pattern] {
            expression = stored
        } else {
            expression = try NSRegularExpression(pattern: pattern, options: [.anchorsMatchLines, .allowCommentsAndWhitespace])
            regularExpressions[pattern] = expression
        }

        do {
            return try take(expression: expression)
        } catch let error as ScannerError where !errorHandlers.isEmpty && allowErrorHandling {
            guard case .failedToMatch = error.reason else { throw error }
            let currentIndex = storage.index
            let errorHandlerScanner = ErroredScanner(scanner: self, allowedToRegisterNodes: false)
            let scanner = ErroredScanner(scanner: self, allowedToRegisterNodes: true)
            for handler in errorHandlers {
                do {
                    try handler.scannerFailedToMatch(errorHandlerScanner, expression: expression)
                    if storage.node.start >= currentIndex {
                        storage.node.update(from: currentIndex, to: storage.index)
                    }

                    return try scanner.take(pattern: pattern)
                } catch let error as ScannerError {
                    guard case .failedToMatch = error.reason else { throw error }
                }
            }

            throw error
        }
    }

    private func take(expression: NSRegularExpression) throws -> ExpressionMatch {
        let rangeToLookAt = NSRange(storage.index..., in: text)
        guard let match = expression.firstMatch(in: text, options: .anchored, range: rangeToLookAt) else {
            throw error(reason: .failedToMatch(expression))
        }

        let result = ExpressionMatch(source: text, match: match)
        if result.range.upperBound > storage.index {
            storage.ids = []
        }
        storage.index = result.range.upperBound

        if let lastError = storage.lastDiagnosticError,
           lastError.location < location(for: result.range.upperBound) {

            storage.lastDiagnosticError = nil
        }

        return result
    }

}

extension StandardScanner {

    private func location(for index: String.Index) -> Location {
        return lineColumnIndex[text.distance(from: text.startIndex, to: index)]!
    }

}

extension StandardScanner {

    private struct ErroredScanner: Scanner {
        let scanner: StandardScanner
        let allowedToRegisterNodes: Bool

        var index: String.Index {
            return scanner.index
        }

        var location: Location {
            return scanner.location
        }

        func prefix(_ length: Int) throws -> Substring {
            return try scanner.prefix(length)
        }

        func preventRecursion(id: UUID) throws {
            try scanner.preventRecursion(id: id)
        }

        func begin() {
            scanner.begin()
        }

        func commit() throws {
            try scanner.commit()
        }

        func rollback() throws {
            try scanner.rollback()
        }

        func enterNode() {
            guard allowedToRegisterNodes else { return }
            scanner.enterNode()
        }

        func exitNode() {
            guard allowedToRegisterNodes else { return }
            scanner.exitNode()
        }

        func pruneNode(strategy: Kind.CombinationStrategy) {
            guard allowedToRegisterNodes else { return }
            pruneNode(strategy: strategy)
        }

        func configureNode(kind: Kind) {
            guard allowedToRegisterNodes else { return }
            scanner.configureNode(kind: kind)
        }

        func configureNode(annotations: [String : Encodable]) {
            guard allowedToRegisterNodes else { return }
            scanner.configureNode(annotations: annotations)
        }

        func removeChildrenOfNode() {
            guard allowedToRegisterNodes else { return }
            scanner.removeChildrenOfNode()
        }

        func locationOfNode() -> Range<Location> {
            return scanner.locationOfNode()
        }

        func take(pattern: String) throws -> ExpressionMatch {
            return try scanner.take(pattern: pattern, allowErrorHandling: false)
        }

        func pop<T>(of type: T.Type) throws -> T {
            return try scanner.pop(of: type)
        }

        func store<T>(value: T) {
            scanner.store(value: value)
        }

        func store(error: DiagnosticError) {
            scanner.store(error: error)
        }

        func parse(using parser: InternalParser) throws {
            try scanner.parse(using: parser)
        }
    }

}

extension StandardScanner {

    private func error(reason: ScannerError.Reason) -> ScannerError {
        return ScannerError(index: storage.index,
                            location: location(for: storage.index),
                            reason: reason)
    }

}

