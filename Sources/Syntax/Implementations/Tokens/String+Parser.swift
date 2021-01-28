
import Foundation
import SyntaxTree

extension String: Parser {
    public static let kind: Kind? = nil

    public var body: AnyParser<Void> {
        StringTokenParser(string: self)
    }
}

private struct StringTokenParser: Parser, InternalParser {
    let id = UUID()
    let string: String

    var body: AnyParser<Void> {
        return neverBody()
    }

    func prefixes() -> Set<String> {
        return [string]
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        let match = try scanner.take(substring: string)
        scanner.exitNode()
        scanner.configureNode(kind: .tokenMatch)
        scanner.configureNode(annotations: ["match" : match])
    }
}
