
import Foundation

extension Parser {

    public func map<T>(_ transform: @escaping (Output) throws -> T) -> AnyParser<T> {
        return MappedParser<Self, T>(parser: internalParser(),
                                     transform: transform).eraseToAnyParser()
    }

    public func map<T>(to value: T) -> AnyParser<T> {
        return map { _ in value }
    }

}

private struct MappedParser<Source: Parser, Output>: Parser, Identified {
    public let id = UUID()
    fileprivate let parser: InternalParser
    fileprivate let transform: (Source.Output) throws -> Output

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension MappedParser: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: parser)
        let transformed: Output
        if Source.Output.self != Void.self {
            let output = try scanner.pop(of: Source.Output.self)
            transformed = try transform(output)
        } else {
            transformed = try transform(() as! Source.Output)
        }

        if Output.self != Void.self {
            scanner.store(value: transformed)
        }
    }

}
