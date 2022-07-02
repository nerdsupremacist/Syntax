
import Foundation
@_exported import SyntaxTree

struct Token: Parser, Hashable {
    let id = UUID()
    private let string: String

    init(_ string: String) {
        self.string = string
    }

    var body: AnyParser<Substring> {
        return neverBody()
    }
}

extension Token: InternalParser {

    func prefixes() -> Set<String> {
        return [string]
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        let match = try scanner.take(substring: string)
        scanner.store(value: match)
        scanner.exitNode()
        scanner.configureNode(kind: .tokenMatch)
        scanner.configureNode(annotations: ["match" : String(match)])
    }

}

extension Kind {

    public static let tokenMatch: Kind = "token.match"

}
