
import Foundation

extension Parser {

    public func annotate(_ annotations: @escaping (Output) -> [String : String]) -> AnyParser<Output> {
        return Annotator(content: internalParser(), annotations: annotations).eraseToAnyParser()
    }

}

private struct Annotator<Output>: Parser {
    fileprivate let content: InternalParser
    fileprivate let annotations: (Output) -> [String : String]

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension Annotator: InternalParser {

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        try content.parse(using: scanner)
        scanner.exitNode()
        let value: Output
        if Output.self != Void.self {
            value = try scanner.pop(of: Output.self)
            scanner.store(value: value)
        } else {
            value = () as! Output
        }
        let annotations = self.annotations(value)
        scanner.configureNode(annotations: annotations)
        scanner.pruneNode()
    }

    func prefixes() -> Set<String> {
        return content.prefixes()
    }

}
