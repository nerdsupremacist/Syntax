
import Foundation
@_exported import SyntaxTree

extension String: Parser {
    public static let kind: Kind? = nil

    public var body: any Parser<Void> {
        StringTokenParser(string: self)
    }
}

private struct StringTokenParser: Parser {
    let string: String

    var body: any Parser<Void> {
        return neverBody()
    }
}

extension StringTokenParser: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let string: String

        init(string: String) {
            self.string = string
        }
        
        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return .higher
        }

        func prefixes() -> Set<String> {
            return [string]
        }

        func parse(using scanner: Scanner) throws {
            let match = try scanner.withNewNode { scanner in
                try scanner.take(substring: string)
            }
            scanner.configureNode(kind: .tokenMatch)
            scanner.configureNode(annotations: ["match" : String(match)])
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(string: string)
    }
}
