
import Foundation


extension Parser {

    public func preventRecursion() -> any Parser<Parsed> {
        return PreventRecursion(parser: internalParser())
    }

}

private class PreventRecursion<Parsed>: Parser {
    fileprivate let parser: InternalParser

    init(parser: InternalParser) {
        self.parser = parser
    }

    var body: any Parser<Parsed> {
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
