
import Foundation
@_exported import SyntaxTree

public struct RegularExpression: Parser, Hashable {
    private let pattern: String

    public init(_ pattern: String) {
        self.pattern = pattern
    }

    public var body: any Parser<ExpressionMatch> {
        return neverBody()
    }
}

extension RegularExpression: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let pattern: String

        init(pattern: String) {
            self.pattern = pattern
        }
        
        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return .higher
        }

        func prefixes() -> Set<String> {
            return []
        }

        func parse(using scanner: Scanner) throws {
            let match = try scanner.withNewNode { scanner in
                let match = try scanner.take(pattern: pattern)
                scanner.store(value: match)
                return match
            }
            scanner.configureNode(kind: .expressionMatch)
            scanner.configureNode(annotations: ["match" : String(match.text)])
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(pattern: pattern)
    }
}

extension Kind {

    public static let expressionMatch: Kind = "regular.expression.match"

}
