
import Foundation

extension Parser {

    public func annotate(_ annotations: @escaping (Parsed) -> [String : Encodable]) -> some Parser<Parsed> {
        return Annotator(content: self, annotations: annotations)
    }

}

private struct Annotator<Content : Parser>: Parser {
    fileprivate let content: Content
    fileprivate let annotations: (Content.Parsed) -> [String : Encodable]

    var body: any Parser<Content.Parsed> {
        return neverBody()
    }
}

extension Annotator: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        fileprivate let content: InternalParser
        fileprivate let annotations: (Content.Parsed) -> [String : Encodable]

        init(content: InternalParser, annotations: @escaping (Content.Parsed) -> [String : Encodable]) {
            self.content = content
            self.annotations = annotations
        }

        func prefixes() -> Set<String> {
            return content.prefixes().union([""])
        }

        func parse(using scanner: Scanner) throws {
            scanner.enterNode()
            try scanner.parse(using: content)
            scanner.exitNode()
            let value: Parsed
            if Parsed.self != Void.self {
                value = try scanner.pop(of: Parsed.self)
                scanner.store(value: value)
            } else {
                value = () as! Parsed
            }
            let annotations = self.annotations(value)
            scanner.configureNode(annotations: annotations)
            scanner.pruneNode(strategy: .separate)
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content), annotations: annotations)
    }
}
