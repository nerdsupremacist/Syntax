
import Foundation

public struct AnyParser<Output>: Parser, Identified {
    public let id = UUID()
    let parser: InternalParser

    public init<Content : Parser>(_ content: Content) where Content.Output == Output {
        let internalParser = content.internalParser()
        if let internalParser = internalParser as? AnyParser<Output> {
            self.parser = internalParser.parser
        } else {
            self.parser = internalParser
        }
    }
    
    public var body: AnyParser<Output> {
        return neverBody()
    }
}

extension AnyParser: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: parser)
    }

}

extension Parser {

    public func eraseToAnyParser() -> AnyParser<Output> {
        return AnyParser(self)
    }

}
