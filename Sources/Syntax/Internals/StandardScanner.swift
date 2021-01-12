
import Foundation

class StandardScanner: Scanner {
    private class Node {
        let start: String.Index
        var updatedIndex: String.Index? = nil
        var parent: Node? = nil
        var children: [SyntaxTree] = []

        init(start: String.Index, parent: Node? = nil) {
            self.start = start
            self.parent = parent
        }
    }

    private class Storage {
        var index: String.Index
        let parent: Storage?
        var node: Node
        var values: [Any] = []
        var ids: Set<UUID>

        init(index: String.Index, parent: Storage?) {
            self.index = index
            self.node = Node(start: index, parent: nil)
            self.ids = parent?.ids ?? []
            self.parent = parent
        }
    }

    private let text: String
    private let lineColumnIndex: LineColumnIndex
    private var storage: Storage
    private var regularExpressions: [String : NSRegularExpression] = [:]

    private let errorHandlers: [ScannerErrorHandler]

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
            throw ScannerError.failedToMatch(expression, at: text[storage.index...])
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

        if parent.start == storage.node.start, let updated = storage.node.updatedIndex {
            parent.updatedIndex = updated
        }

        let startIndex = storage.node.updatedIndex ?? storage.node.start
        let endIndex = storage.index
        let startOffset = text.distance(from: text.startIndex, to: startIndex)
        let endOffset = text.distance(from: text.startIndex, to: endIndex)

        let syntaxTree = SyntaxTree(range: startOffset..<endOffset,
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
        let startIndex = storage.node.updatedIndex ?? storage.node.start
        let endIndex = storage.index
        let startOffset = text.distance(from: text.startIndex, to: startIndex)
        let endOffset = text.distance(from: text.startIndex, to: endIndex)
        return lineColumnIndex[startOffset]!..<lineColumnIndex[endOffset]!
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
            throw ScannerError.attemptedToPopValueFromEmptyList(type)
        }

        if let value = value as? T {
            return value
        } else {
            storage.values.append(value)
            throw ScannerError.poppedValueDidNotMatchExpectedValue(value, expected: type)
        }
    }

    func store<T>(value: T) {
        storage.values.append(value)
    }

    func parse<T : Parser>(using rule: T) throws {
        if let rule = rule as? InternalParser {
            try rule.parse(using: self)
        } else {
            try parse(using: rule.body)
        }
    }
}

extension StandardScanner {

    func syntaxTree() -> SyntaxTree {
        let startIndex = storage.node.start
        let endIndex = storage.index
        let startOffset = text.distance(from: text.startIndex, to: startIndex)
        let endOffset = text.distance(from: text.startIndex, to: endIndex)

        let syntaxTree = SyntaxTree(range: startOffset..<endOffset,
                                    location: lineColumnIndex[startOffset]!..<lineColumnIndex[endOffset]!,
                                    annotations: [:],
                                    children: storage.node.children)

        syntaxTree.prune(using: .separate)
        return syntaxTree
    }

}

extension StandardScanner {

    fileprivate func take(pattern: String, allowErrorHandling: Bool) throws -> ExpressionMatch {
        let expression: NSRegularExpression
        if let stored = regularExpressions[pattern] {
            expression = stored
        } else {
            expression = try NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
            regularExpressions[pattern] = expression
        }

        do {
            return try take(expression: expression)
        } catch ScannerError.failedToMatch(_, let substring) where !errorHandlers.isEmpty && allowErrorHandling {
            let isAtStart = storage.index == storage.node.start
            let errorHandlerScanner = ErroredScanner(scanner: self, allowedToRegisterNodes: false)
            let scanner = ErroredScanner(scanner: self, allowedToRegisterNodes: true)
            for handler in errorHandlers {
                do {
                    try handler.scannerFailedToMatch(errorHandlerScanner, expression: expression)
                    if isAtStart {
                        storage.node.updatedIndex = storage.index
                    }
                    return try scanner.take(pattern: pattern)
                } catch ScannerError.failedToMatch { }
            }

            throw ScannerError.failedToMatch(expression, at: substring)
        }
    }

    private func take(expression: NSRegularExpression) throws -> ExpressionMatch {
        let rangeToLookAt = NSRange(storage.index..., in: text)
        guard let match = expression.firstMatch(in: text, options: .anchored, range: rangeToLookAt) else {
            throw ScannerError.failedToMatch(expression, at: text[storage.index...])
        }

        let result = ExpressionMatch(source: text, match: match)
        if result.range.upperBound > storage.index {
            storage.ids = []
        }
        storage.index = result.range.upperBound
        return result
    }

}

extension StandardScanner {

    private struct ErroredScanner: Scanner {
        let scanner: StandardScanner
        let allowedToRegisterNodes: Bool

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
    }

}
