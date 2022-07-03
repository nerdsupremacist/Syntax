
import Foundation

public struct Annotated<Content : Parser>: Parser {
    private let pattern: String?
    private let content: Content

    public init(pattern: String, @ParserBuilder content: () -> Content) {
        self.pattern = pattern
        self.content = content()
    }

    public init(@ParserBuilder content: () -> Content) {
        self.pattern = nil
        self.content = content()
    }

    public var body: any Parser<AnnotatedString<Content.Parsed>> {
        return neverBody()
    }
}

extension Annotated: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let pattern: String?
        let content: InternalParser

        init(pattern: String?, content: InternalParser) {
            self.pattern = pattern
            self.content = content
        }

        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return content.preferredKindOverrideForDerived
        }

        func prefixes() -> Set<String> {
            return []
        }

        func parse(using scanner: Scanner) throws {
            try scanner.withNewNode { scanner in
                if let pattern = pattern {
                    let match = try scanner.take(pattern: pattern)
                    scanner.beginScanning(in: match.range, clipToLast: false, for: Content.Parsed.self)
                } else {
                    scanner.beginScanning(in: scanner.range, clipToLast: false, for: Content.Parsed.self)
                }

                while (true) {
                    let hasParsed: Bool = scanner.attempt { scanner in
                        try scanner.parse(using: content)
                    }

                    if !hasParsed {
                        break
                    }
                }

                try scanner.commit()
            }
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(pattern: pattern, content: context.build(content))
    }
}
