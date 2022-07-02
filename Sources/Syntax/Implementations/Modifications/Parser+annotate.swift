
import Foundation

extension Parser {

    public func annotate(_ annotations: @escaping (Parsed) -> [String : Encodable]) -> AnyParser<Parsed> {
        return Annotator(content: internalParser(), annotations: annotations).eraseToAnyParser()
    }

}

private struct Annotator<Parsed>: Parser {
    let id = UUID()
    fileprivate let content: InternalParser
    fileprivate let annotations: (Parsed) -> [String : Encodable]

    var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension Annotator: InternalParser {

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

    func prefixes() -> Set<String> {
        return content.prefixes()
    }

}
