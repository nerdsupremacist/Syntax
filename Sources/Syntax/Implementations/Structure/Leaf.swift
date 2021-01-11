
import Foundation

public struct Leaf<Output>: Parser {
    private let parser: InternalParser

    public init<Content : Parser>(@ParserBuilder content: () -> Content) where Content.Output == Output {
        self.parser = content().internalParser()
    }

    public var body: AnyParser<Output> {
        return neverBody()
    }
}

extension Leaf: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        try parser.parse(using: scanner)
        scanner.removeChildrenOfNode()
        scanner.exitNode()
    }

}
