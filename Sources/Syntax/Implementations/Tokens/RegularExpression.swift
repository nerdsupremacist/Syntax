
import Foundation
@_exported import SyntaxTree

public struct RegularExpression: Parser, Hashable {
    let id = UUID()
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
        scanner.configureNode(kind: .expressionMatch)
        scanner.configureNode(annotations: ["match" : String(match.text)])
    }

    func prefixes() -> Set<String> {
        return []
    }

}

extension Kind {

    public static let expressionMatch: Kind = "regular.expression.match"

}
