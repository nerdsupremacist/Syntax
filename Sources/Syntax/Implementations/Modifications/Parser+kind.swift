
import Foundation
@_exported import SyntaxTree

extension Parser {

    public func kind(_ kind: Kind?, using strategy: Kind.CombinationStrategy = .higher) -> any Parser<Parsed> {
        guard let kind = kind else { return self }
        return KindParser(content: self, kind: kind, strategy: strategy)
    }

    public func kind(_ kind: Kind, using strategy: Kind.CombinationStrategy = .higher) -> some Parser<Parsed> {
        return KindParser<Self>(content: self, kind: kind, strategy: strategy)
    }

}

public struct KindParser<Content : Parser>: Parser {
    fileprivate let content: Content
    fileprivate let kind: Kind
    fileprivate let strategy: Kind.CombinationStrategy

    public var body: any Parser<Content.Parsed> {
        return neverBody()
    }
}

extension KindParser: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        let content: InternalParser
        let kind: Kind
        let strategy: Kind.CombinationStrategy

        init(content: InternalParser, kind: Kind, strategy: Kind.CombinationStrategy) {
            self.content = content
            self.kind = kind
            self.strategy = strategy
        }

        func prefixes() -> Set<String> {
            return content.prefixes()
        }

        func parse(using scanner: Scanner) throws {
            try scanner.parseWithNewNode(content)
            scanner.configureNode(kind: kind)
            scanner.pruneNode(strategy: strategy)
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content), kind: kind, strategy: strategy)
    }
}
