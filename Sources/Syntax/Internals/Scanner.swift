
import Foundation

protocol Scanner {
    func preventRecursion(id: UUID) throws

    func enterNode()
    func exitNode()
    func removeChildrenOfNode()

    func configureNode(kind: String)
    func configureNode(annotations: [String : String])
    func pruneNode()

    func prefix(_ length: Int) throws -> Substring

    func begin()

    func commit() throws

    func rollback() throws

    func take(pattern: String) throws -> ExpressionMatch

    func pop<T>(of type: T.Type) throws -> T

    func store<T>(value: T)
}

extension Scanner {
    func take(word: String) throws -> String {
        let match = try take(pattern: NSRegularExpression.escapedPattern(for: word) + "\\b")
        return String(match.text)
    }

    func take(substring: String) throws -> String {
        let match = try take(pattern: NSRegularExpression.escapedPattern(for: substring))
        return String(match.text)
    }

    func parse<T : Parser>(using parser: T) throws {
        let internalParser = parser.internalParser()
        try internalParser.parse(using: self)
    }
}
