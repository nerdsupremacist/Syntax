
import Foundation

extension Parser {

    public func maybe() -> some Parser<Parsed?> {
        return Maybe(content: self)
    }

    public func maybe(default defaultOutput: Parsed) -> some Parser<Parsed> {
        return maybe().map { $0 ?? defaultOutput }
    }

    public func maybe(default defaultOutput: Parsed?) -> some Parser<Parsed?> {
        return maybe().map { $0 ?? defaultOutput }
    }

}

public struct Maybe<Content : Parser>: Parser {
    fileprivate let content: Content

    public var body: any Parser<Content.Parsed?> {
        return neverBody()
    }
}

extension Maybe {
    public init(@ParserBuilder content: () -> Content) {
        self.content = content()
    }
}

extension Maybe: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let content: InternalParser

        init(content: InternalParser) {
            self.content = content
        }

        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return content.preferredKindOverrideForDerived
        }

        func prefixes() -> Set<String> {
            return content.prefixes().union([""])
        }

        func parse(using scanner: Scanner) throws {
            let parsed: Bool = scanner.attempt { scanner in
                try scanner.parse(using: content)
            }

            if !parsed {
                scanner.store(value: nil as Parsed)
            }
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content))
    }
}
