
import Foundation


extension Parser {

    public func preventRecursion() -> AnyParser<Output> {
        return PreventRecursion(parser: internalParser()).eraseToAnyParser()
    }

}

private class PreventRecursion<Output>: Parser {
    fileprivate let parser: InternalParser

    init(parser: InternalParser) {
        self.parser = parser
    }

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension PreventRecursion: InternalParser {

    var id: UUID {
        return parser.id
    }

    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.preventRecursion(id: id)
        try parser.parse(using: scanner)
    }

}
