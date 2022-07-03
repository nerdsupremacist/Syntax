
import Foundation

extension Parser {

    public func preventRecursion() -> some Parser<Parsed> {
        return PreventRecursion(content: self)
    }

}

private class PreventRecursion<Content : Parser>: Parser {
    fileprivate let content: Content

    init(content: Content) {
        self.content = content
    }

    var body: any Parser<Content.Parsed> {
        return neverBody()
    }
}

extension PreventRecursion: InternalParserBuilder {
    private class _Parser: InternalParser {
        private let _id = UUID()

        var id: UUID? {
            return nil
        }

        let content: InternalParser

        init(content: InternalParser) {
            self.content = content
        }

        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return content.preferredKindOverrideForDerived
        }

        func prefixes() -> Set<String> {
            return content.prefixes()
        }

        func parse(using scanner: Scanner) throws {
            try scanner.preventRecursion(id: _id)
            try scanner.parse(using: content)
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content))
    }
}
