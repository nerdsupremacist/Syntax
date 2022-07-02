
import Foundation
@_exported import SyntaxTree

extension Parser {

    public func mapWithLocation<T>(_ transform: @escaping (Parsed, Range<Location>) throws -> T) -> AnyParser<T> {
        return ParserWithLocation<Self, T>(parser: internalParser(),
                                           transform: transform).eraseToAnyParser()
    }

}

private struct ParserWithLocation<Source: Parser, Parsed>: Parser {
    let id = UUID()
    fileprivate let parser: InternalParser
    fileprivate let transform: (Source.Parsed, Range<Location>) throws -> Parsed

    var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension ParserWithLocation: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        scanner.enterNode()
        try scanner.parse(using: parser)
        scanner.exitNode()
        let location = scanner.locationOfNode()
        scanner.exitNode()
        let transformed: Parsed
        if Source.Parsed.self != Void.self {
            let output = try scanner.pop(of: Source.Parsed.self)
            transformed = try transform(output, location)
        } else {
            transformed = try transform(() as! Source.Parsed, location)
        }

        if Parsed.self != Void.self {
            scanner.store(value: transformed)
        }

        scanner.pruneNode(strategy: .separate)
    }

}
