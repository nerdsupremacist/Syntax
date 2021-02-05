
import Foundation
import SyntaxTree

// MARK: StandardScanner

class StandardScanner {
    private let text: String
    private let lineColumnIndex: LineColumnIndex
    private var state: ScannerState
    private var regularExpressions: [String : NSRegularExpression] = [:]
    private let memoizationStorage = MemoizationStorage()

    private let errorHandlers: [ScannerErrorHandler]

    init(text: String, errorHandlers: [ScannerErrorHandler]) {
        self.text = text
        self.lineColumnIndex = LineColumnIndex(string: text)
        self.state = ScannerState(text: text)
        self.errorHandlers = errorHandlers
    }
}

// MARK: - Scanner

extension StandardScanner: Scanner {
    var range: Range<String.Index> {
        return state.range
    }

    var location: Location {
        return state.location(for: state.range.lowerBound)
    }

    func prefix(_ length: Int) throws -> Substring? {
        return try state.prefix(length)
    }

    func preventRecursion(id: UUID) throws {
        try state.preventRecursion(id: id)
    }

    func begin() {
        state = state.begin()
    }

    func beginScanning<T>(in range: Range<String.Index>, for type: T.Type) {
        assert(range.upperBound <= state.range.upperBound)
        state = state.beginScanning(in: range, for: type)
    }

    func commit() throws {
        guard let commited = try state.commit() else { return }
        state = commited
    }

    func rollback() throws {
        guard let rolledback = state.rollback() else { return }
        state = rolledback
    }

    func enterNode() {
        state.enterNode()
    }

    func exitNode() {
        state.exitNode(in: text, lineColumnIndex: lineColumnIndex)
    }

    func removeChildrenOfNode() {
        state.removeChildrenOfNode()
    }

    func locationOfNode() -> Range<Location> {
        return state.location(for: state.node.start)..<state.location(for: state.range.lowerBound)
    }

    func configureNode(kind: Kind) {
        state.configureNode(kind: kind)
    }

    func configureNode(annotations: [String : Encodable]) {
        state.configureNode(annotations: annotations)
    }

    func pruneNode(strategy: Kind.CombinationStrategy) {
        state.pruneNode(strategy: strategy)
    }

    func take(pattern: String) throws -> ExpressionMatch {
        return try take(pattern: pattern, allowErrorHandling: true)
    }

    func pop<T>(of type: T.Type = T.self) throws -> T {
        guard let value = try state.pop(of: type) else {
            throw state.error(reason: .attemptedToPopValueFromEmptyList(type))
        }

        return value
    }

    func store<T>(value: T) {
        state.store(value: value)
    }

    func store(error: DiagnosticError) {
        state.store(error: error)
    }

    func parse(using parser: InternalParser) throws {
        try state.parse(using: parser, with: self, memoizationStorage: memoizationStorage)
    }
}

// MARK: - Syntax Tree

extension StandardScanner {

    func syntaxTree() -> SyntaxTree {
        let startIndex = state.node.start
        let endIndex = state.range.lowerBound
        let startOffset = text.distance(from: text.startIndex, to: startIndex)
        let endOffset = text.distance(from: text.startIndex, to: endIndex)

        let syntaxTree = MutableSyntaxTree(range: startOffset..<endOffset,
                                           location: lineColumnIndex[startOffset]!..<lineColumnIndex[endOffset]!,
                                           annotations: [:],
                                           children: state.node.children)

        syntaxTree.prune(using: .separate)
        return syntaxTree.build()
    }

}

// MARK: - Final Checks

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
        if let lastError = state.lastDiagnosticError {
            throw lastError
        }

        if !state.range.isEmpty {
            let token: Substring
            do {
                let expression = try NSRegularExpression(pattern: "\\S+")
                let rangeToLookAt = NSRange(state.range, in: text)
                if let match = expression.firstMatch(in: text, range: rangeToLookAt) {
                    let range = Range(match.range, in: text)!
                    token = text[range]
                } else {
                    token = text[state.range]
                }
            } catch {
                token = text[state.range]
            }

            throw state.error(reason: .unexpectedToken(String(token)))
        }
    }

}

// MARK: - Regular Expressions

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
        } catch let error as ScannerError where !errorHandlers.isEmpty && allowErrorHandling && state.allowErrorHandling {
            guard case .failedToMatch = error.reason else { throw error }
            let currentIndex = state.range.lowerBound
            let errorHandlerScanner = ErroredScanner(scanner: self, allowedToRegisterNodes: false)
            let scanner = ErroredScanner(scanner: self, allowedToRegisterNodes: true)
            for handler in errorHandlers {
                do {
                    try handler.scannerFailedToMatch(errorHandlerScanner, expression: expression)
                    if state.node.start >= currentIndex {
                        state.node.update(from: currentIndex, to: state.range.lowerBound)
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
        let result = try state.take(expression: expression, in: text)
        state = result.state
        return result.match
    }

}

// MARK: - Error Handling

extension StandardScanner {

    private struct ErroredScanner: Scanner {
        let scanner: StandardScanner
        let allowedToRegisterNodes: Bool

        var range: Range<String.Index> {
            return scanner.range
        }

        var location: Location {
            return scanner.location
        }

        func prefix(_ length: Int) throws -> Substring? {
            return try scanner.prefix(length)
        }

        func preventRecursion(id: UUID) throws {
            try scanner.preventRecursion(id: id)
        }

        func begin() {
            scanner.begin()
        }

        func beginScanning<T>(in range: Range<String.Index>, for type: T.Type) {
            scanner.beginScanning(in: range, for: type)
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
