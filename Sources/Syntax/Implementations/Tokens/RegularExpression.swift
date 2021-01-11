
import Foundation

public struct RegularExpression: Parser {
    private let pattern: String

    public init(_ pattern: String) {
        self.pattern = pattern
    }

    public var body: AnyParser<ExpressionMatch> {
        return neverBody()
    }
}

extension RegularExpression: InternalParser {

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        let match = try scanner.take(pattern: pattern)
        scanner.store(value: match)
        scanner.exitNode()
        scanner.configureNode(kind: "regular.expression.match")
        scanner.configureNode(annotations: ["match" : String(match.text)])
    }

    func prefixes() -> Set<String> {
        return []
    }

}
