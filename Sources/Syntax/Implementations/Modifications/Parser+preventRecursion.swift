
import Foundation


extension Parser {

    public func preventRecursion() -> AnyParser<Output> {
        return PreventRecursion(parser: internalParser()).eraseToAnyParser()
    }

}

private class PreventRecursion<Output>: Parser, Identified {
    public let id = UUID()
    fileprivate let parser: InternalParser

    init(parser: InternalParser) {
        self.parser = parser
    }

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension PreventRecursion: InternalParser {

    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.preventRecursion(id: id)
        try scanner.parse(using: parser)
    }

}
