
import Foundation
@_exported import SyntaxTree

extension Parser {

    public func kind(_ kind: Kind?, using strategy: Kind.CombinationStrategy = .higher) -> any Parser<Parsed> {
        guard let kind = kind else { return self }
        return KindParser(content: internalParser(), kind: kind, strategy: strategy)
    }

    public func kind(_ kind: Kind, using strategy: Kind.CombinationStrategy = .higher) -> some Parser<Parsed> {
        return KindParser<Parsed>(content: internalParser(), kind: kind, strategy: strategy)
    }

}

public struct KindParser<Parsed>: Parser {
    let id = UUID()
    fileprivate let content: InternalParser
    fileprivate let kind: Kind
    fileprivate let strategy: Kind.CombinationStrategy

    public var body: any Parser<Parsed> {
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
