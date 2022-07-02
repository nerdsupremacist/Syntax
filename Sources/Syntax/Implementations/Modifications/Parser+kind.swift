
import Foundation
@_exported import SyntaxTree

extension Parser {

    public func kind(_ kind: Kind?, using strategy: Kind.CombinationStrategy = .higher) -> AnyParser<Parsed> {
        guard let kind = kind else { return eraseToAnyParser() }
        return KindParser(content: internalParser(), kind: kind, strategy: strategy).eraseToAnyParser()
    }

    public func kind(_ kind: Kind, using strategy: Kind.CombinationStrategy = .higher) -> AnyParser<Parsed> {
        return KindParser(content: internalParser(), kind: kind, strategy: strategy).eraseToAnyParser()
    }

}

private struct KindParser<Parsed>: Parser {
    let id = UUID()
    fileprivate let content: InternalParser
    fileprivate let kind: Kind
    fileprivate let strategy: Kind.CombinationStrategy

    var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension KindParser: InternalParser {
    func prefixes() -> Set<String> {
        return content.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        try scanner.parse(using: content)
        scanner.exitNode()
        scanner.configureNode(kind: kind)
        scanner.pruneNode(strategy: strategy)
    }
}
