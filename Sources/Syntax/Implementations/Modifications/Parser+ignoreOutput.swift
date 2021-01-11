
import Foundation

extension Parser {

    public func ignoreOutput() -> AnyParser<Void> {
        return IgnoreRule<Self>(parser: internalParser()).eraseToAnyParser()
    }

}

struct IgnoreRule<Source : Parser>: Parser {
    typealias Output = Void
    fileprivate let parser: InternalParser

    var body: AnyParser<Void> {
        return neverBody()
    }
}

extension IgnoreRule: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try parser.parse(using: scanner)
        if Source.Output.self != Void.self {
            _ = try scanner.pop(of: Source.Output.self)
        }
    }

}
