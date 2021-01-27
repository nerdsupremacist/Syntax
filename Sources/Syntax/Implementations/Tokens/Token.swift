
import Foundation
import SyntaxTree

struct Token: Parser, Hashable {
    let id = UUID()
    private let string: String

    init(_ string: String) {
        self.string = string
    }

    var body: AnyParser<String> {
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
        scanner.configureNode(annotations: ["match" : match])
    }

}

extension Kind {

    public static let tokenMatch: Kind = "token.match"

}

extension String: Parser {

    public var body: AnyParser<Void> {
        Token(self)
            .ignoreOutput()
    }

}
