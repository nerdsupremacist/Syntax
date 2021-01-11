
import Foundation

extension Parser {

    public func kind(_ kind: String?) -> AnyParser<Output> {
        guard let kind = kind else { return eraseToAnyParser() }
        return Kind(content: internalParser(), kind: kind).eraseToAnyParser()
    }

    public func kind(_ kind: String) -> AnyParser<Output> {
        return Kind(content: internalParser(), kind: kind).eraseToAnyParser()
    }

}

private struct Kind<Output>: Parser {
    fileprivate let content: InternalParser
    fileprivate let kind: String

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension Kind: InternalParser {
    func prefixes() -> Set<String> {
        return content.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        try content.parse(using: scanner)
        scanner.exitNode()
        scanner.configureNode(kind: kind)
        scanner.pruneNode()
    }

}
