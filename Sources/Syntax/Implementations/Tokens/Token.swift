
import Foundation

struct Token: Parser {
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
        scanner.configureNode(kind: "token.match")
        scanner.configureNode(annotations: ["match" : match])
    }

}


extension String: Parser {

    public var body: AnyParser<Void> {
        Token(self)
            .ignoreOutput()
    }

}
