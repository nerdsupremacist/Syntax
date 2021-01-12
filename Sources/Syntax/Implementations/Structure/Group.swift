
import Foundation

public struct Group<Content : Parser>: Parser {
    private let content: InternalParser

    public init(@ParserBuilder content: () -> Content) {
        self.content = content().internalParser()
    }

    public var body: AnyParser<Content.Output> {
        return neverBody()
    }
}

extension Group: InternalParser {

    func prefixes() -> Set<String> {
        return content.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try content.parse(using: scanner)
    }

}
