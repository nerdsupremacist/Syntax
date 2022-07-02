
import Foundation

extension Parser {

    public func map<T>(_ transform: @escaping (Parsed) throws -> T) -> some Parser<T> {
        return MappedParser<Self, T>(content: self, transform: transform)
    }

    public func map<T>(to value: T) -> some Parser<T> {
        return map { _ in value }
    }

}

private struct MappedParser<Content: Parser, Parsed>: Parser {
    fileprivate let content: Content
    fileprivate let transform: (Content.Parsed) throws -> Parsed

    var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension MappedParser: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        let content: InternalParser
        let transform: (Content.Parsed) throws -> Parsed

        init(content: InternalParser, transform: @escaping (Content.Parsed) throws -> Parsed) {
            self.content = content
            self.transform = transform
        }

        func prefixes() -> Set<String> {
            return content.prefixes()
        }

        func parse(using scanner: Scanner) throws {
            try scanner.parse(using: content)
            let transformed: Parsed
            if Content.Parsed.self != Void.self {
                let output = try scanner.pop(of: Content.Parsed.self)
                transformed = try transform(output)
            } else {
                transformed = try transform(() as! Content.Parsed)
            }

            if Parsed.self != Void.self {
                scanner.store(value: transformed)
            }
        }
    }

    func buildParser<Context>(context: inout Context) -> InternalParser where Context : InternalParserBuilderContext {
        return _Parser(content: context.build(content), transform: transform)
    }
}
