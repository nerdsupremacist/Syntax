
import Foundation
@_exported import SyntaxTree

extension Parser {

    public func mapWithLocation<T>(_ transform: @escaping (Output, Range<Location>) throws -> T) -> AnyParser<T> {
        return ParserWithLocation<Self, T>(parser: internalParser(),
                                           transform: transform).eraseToAnyParser()
    }

}

private struct ParserWithLocation<Source: Parser, Output>: Parser {
    let id = UUID()
    fileprivate let parser: InternalParser
    fileprivate let transform: (Source.Output, Range<Location>) throws -> Output

    var body: AnyParser<Output> {
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
