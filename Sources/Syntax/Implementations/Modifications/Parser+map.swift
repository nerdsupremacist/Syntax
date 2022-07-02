
import Foundation

extension Parser {

    public func map<T>(_ transform: @escaping (Parsed) throws -> T) -> AnyParser<T> {
        return MappedParser<Self, T>(parser: internalParser(),
                                     transform: transform).eraseToAnyParser()
    }

    public func map<T>(to value: T) -> AnyParser<T> {
        return map { _ in value }
    }

}

private struct MappedParser<Source: Parser, Parsed>: Parser {
    let id = UUID()
    fileprivate let parser: InternalParser
    fileprivate let transform: (Source.Parsed) throws -> Parsed

    var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension MappedParser: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: parser)
        let transformed: Parsed
        if Source.Parsed.self != Void.self {
            let output = try scanner.pop(of: Source.Parsed.self)
            transformed = try transform(output)
        } else {
            transformed = try transform(() as! Source.Parsed)
        }

        if Parsed.self != Void.self {
            scanner.store(value: transformed)
        }
    }

}
