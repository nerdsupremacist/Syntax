
import Foundation
import SyntaxTree

extension Parser {

    public func mapWithLocation<T>(_ transform: @escaping (Output, Range<Location>) throws -> T) -> AnyParser<T> {
        return MappedParser<Self, T>(parser: internalParser(),
                                     transform: transform).eraseToAnyParser()
    }

}

private struct MappedParser<Source: Parser, Output>: Parser, Identified {
    public let id = UUID()
    fileprivate let parser: InternalParser
    fileprivate let transform: (Source.Output, Range<Location>) throws -> Output

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension MappedParser: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        try scanner.parse(using: parser)
        scanner.exitNode()
        let location = scanner.locationOfNode()
        let transformed: Output
        if Source.Output.self != Void.self {
            let output = try scanner.pop(of: Source.Output.self)
            transformed = try transform(output, location)
        } else {
            transformed = try transform(() as! Source.Output, location)
        }

        if Output.self != Void.self {
            scanner.store(value: transformed)
        }

        scanner.pruneNode(strategy: .separate)
    }

}
