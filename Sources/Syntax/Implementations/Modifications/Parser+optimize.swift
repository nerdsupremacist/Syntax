
import Foundation

extension Parser {

    func optimize(using prefixes: String...) -> some Parser<Parsed> {
        return OptimizedPrefixes(content: self, optimizations: Set(prefixes))
    }

    func optimize(using prefixes: Set<String>) -> some Parser<Parsed> {
        return OptimizedPrefixes(content: self, optimizations: prefixes)
    }

}

private struct OptimizedPrefixes<Content : Parser>: Parser {
    let content: Content
    let optimizations: Set<String>

    var body: any Parser<Content.Parsed> {
        return neverBody()
    }
}

extension OptimizedPrefixes: InternalParserBuilder {
    private class _Parser: InternalParser {
        var id: UUID? {
            return nil
        }
        
        let content: InternalParser
        let optimizations: Set<String>

        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return content.preferredKindOverrideForDerived
        }

        init(content: InternalParser, optimizations: Set<String>) {
            self.content = content
            self.optimizations = optimizations
        }

        func prefixes() -> Set<String> {
            return optimizations.union(content.prefixes())
        }

        func parse(using scanner: Scanner) throws {
            try scanner.parse(using: content)
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content), optimizations: optimizations)
    }
}
