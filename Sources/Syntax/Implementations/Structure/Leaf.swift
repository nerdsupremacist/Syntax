
import Foundation

public struct Leaf<Content : Parser>: Parser {
    private let content: Content

    public init(@ParserBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: any Parser<Content.Parsed> {
        return neverBody()
    }
}

extension Leaf: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        let content: InternalParser

        init(content: InternalParser) {
            self.content = content
        }

        func prefixes() -> Set<String> {
            return content.prefixes()
        }

        func parse(using scanner: Scanner) throws {
            try scanner.withNewNode { scanner in
                try scanner.parse(using: content)
                scanner.removeChildrenOfNode()
            }
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content))
    }
}
