
import Foundation

extension Parser {

    public func ignoreOutput() -> some Parser<Void> {
        return IgnoreRule<Self>(content: self)
    }

}

struct IgnoreRule<Content : Parser>: Parser {
    fileprivate let content: Content

    var body: any Parser<Void> {
        return neverBody()
    }
}

extension IgnoreRule: InternalParserBuilder {
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
            try scanner.parse(using: content)
            if Content.Parsed.self != Void.self {
                _ = try scanner.pop(of: Content.Parsed.self)
            }
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content))
    }
}
