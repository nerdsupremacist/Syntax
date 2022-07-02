
import Foundation

extension Parser {

    func optimize(using prefixes: String...) -> some Parser<Parsed> {
        return OptimizedPrefixes(parser: internalParser(), optimizations: Set(prefixes))
    }

    func optimize(using prefixes: Set<String>) -> some Parser<Parsed> {
        return OptimizedPrefixes(parser: internalParser(), optimizations: prefixes)
    }

}

private struct OptimizedPrefixes<Parsed>: Parser {
    let parser: InternalParser
    let optimizations: Set<String>

    var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension OptimizedPrefixes: InternalParser {

    var id: UUID {
        return parser.id
    }

    func prefixes() -> Set<String> {
        return optimizations
    }

    func parse(using scanner: Scanner) throws {
        try parser.parse(using: scanner)
    }

}
