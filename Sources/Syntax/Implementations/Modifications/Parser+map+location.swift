
import Foundation
@_exported import SyntaxTree

extension Parser {

    public func mapWithLocation<T>(_ transform: @escaping (Parsed, Range<Location>) throws -> T) -> some Parser<T> {
        return ParserWithLocation<Self, T>(content: self, transform: transform)
    }

}

private struct ParserWithLocation<Content: Parser, Parsed>: Parser {
    fileprivate let content: Content
    fileprivate let transform: (Content.Parsed, Range<Location>) throws -> Parsed

    var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension ParserWithLocation: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let content: InternalParser
        let transform: (Content.Parsed, Range<Location>) throws -> Parsed

        init(content: InternalParser, transform: @escaping (Content.Parsed, Range<Location>) throws -> Parsed) {
            self.content = content
            self.transform = transform
        }
        
        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return content.preferredKindOverrideForDerived
        }

        func prefixes() -> Set<String> {
            return content.prefixes()
        }

        func parse(using scanner: Scanner) throws {
            let location = try scanner.withNewNode { scanner in
                try scanner.parseWithNewNode(content)
                return scanner.locationOfNode()
            }
            let transformed: Parsed
            if Content.Parsed.self != Void.self {
                let output = try scanner.pop(of: Content.Parsed.self)
                transformed = try transform(output, location)
            } else {
                transformed = try transform(() as! Content.Parsed, location)
            }

            if Content.Parsed.self != Void.self {
                scanner.store(value: transformed)
            }

            scanner.pruneNode(strategy: .separate)
        }
    }

    func buildParser<Context>(context: inout Context) -> InternalParser where Context : InternalParserBuilderContext {
        return _Parser(content: context.build(content), transform: transform)
    }
}
