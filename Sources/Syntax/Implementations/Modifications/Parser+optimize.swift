
import Foundation

extension Parser {

    func optimize(using prefixes: String...) -> AnyParser<Parsed> {
        return OptimizedPrefixes(parser: internalParser(), optimizations: Set(prefixes)).eraseToAnyParser()
    }

    func optimize(using prefixes: Set<String>) -> AnyParser<Parsed> {
        return OptimizedPrefixes(parser: internalParser(), optimizations: prefixes).eraseToAnyParser()
    }

}

private struct OptimizedPrefixes<Parsed>: Parser {
    let parser: InternalParser
    let optimizations: Set<String>

    var body: AnyParser<Parsed> {
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
