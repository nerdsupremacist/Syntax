
import Foundation
@_exported import SyntaxTree

struct Token: Parser, Hashable {
    private let string: String

    init(_ string: String) {
        self.string = string
    }

    var body: any Parser<Substring> {
        return neverBody()
    }
}

extension Token: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        let string: String

        init(string: String) {
            self.string = string
        }

        func prefixes() -> Set<String> {
            return [string]
        }

        func parse(using scanner: Scanner) throws {
            let match = try scanner.withNewNode { scanner in
                let match = try scanner.take(substring: string)
                scanner.store(value: match)
                return match
            }
            scanner.configureNode(kind: .tokenMatch)
            scanner.configureNode(annotations: ["match" : String(match)])
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(string: string)
    }
}

extension Kind {

    public static let tokenMatch: Kind = "token.match"

}
