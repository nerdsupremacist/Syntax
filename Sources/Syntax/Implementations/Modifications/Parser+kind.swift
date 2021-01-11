
import Foundation

extension Parser {

    public func kind(_ kind: Kind?) -> AnyParser<Output> {
        guard let kind = kind else { return eraseToAnyParser() }
        return KindParser(content: internalParser(), kind: kind).eraseToAnyParser()
    }

    public func kind(_ kind: Kind) -> AnyParser<Output> {
        return KindParser(content: internalParser(), kind: kind).eraseToAnyParser()
    }

}

private struct KindParser<Output>: Parser {
    fileprivate let content: InternalParser
    fileprivate let kind: Kind

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension KindParser: InternalParser {
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
