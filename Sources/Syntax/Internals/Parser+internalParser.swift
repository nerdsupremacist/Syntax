
import Foundation

extension Parser {

    func internalParser() -> InternalParser {
        if let parser = self as? AnyParser<Output> {
            return parser.parser
        }

        if let parser = self as? InternalParser {
            return parser
        }

        return body.parser.wrapContent { InternalParserWrapper<Self>(content: $0) }
    }

}

private struct InternalParserWrapper<T : Parser>: InternalParser {
    let id = UUID()
    let content: InternalParser

    func prefixes() -> Set<String> {
        return content.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        try content.parse(using: scanner)
        scanner.exitNode()
        if let kind = T.kind {
            scanner.configureNode(kind: kind)
            scanner.pruneNode(strategy: .lower)
        }

        if T.Output.self != Void.self {
            let value = try scanner.pop(of: T.Output.self)
            scanner.store(value: value)

            if let value = value as? Encodable {
                scanner.configureNode(annotations: ["value" : value])
            }
            scanner.pruneNode(strategy: .separate)
        }
    }
}
