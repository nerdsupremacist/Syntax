
import Foundation

public struct AnyParser<Parsed>: Parser {
    let parser: InternalParser

    init(_ internalParser: InternalParser) {
        if let internalParser = internalParser as? AnyParser<Parsed> {
            self.parser = internalParser.parser
        } else {
            self.parser = internalParser
        }
    }

    public init<Content : Parser>(_ content: Content) where Content.Parsed == Parsed {
        let internalParser = content.internalParser()
        self.init(internalParser)
    }
    
    public var body: AnyParser<Parsed> {
        return neverBody()
    }
}

extension AnyParser: InternalParser {
    var id: UUID {
        return parser.id
    }

    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try parser.parse(using: scanner)
    }
}

extension Parser {

    public func eraseToAnyParser() -> AnyParser<Parsed> {
        return AnyParser(self)
    }

}
