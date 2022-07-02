
import Foundation

extension Parser {

    public func ignoreOutput() -> any Parser<Void> {
        return IgnoreRule<Self>(parser: internalParser())
    }

}

struct IgnoreRule<Source : Parser>: Parser {
    typealias Parsed = Void
    
    let id = UUID()
    fileprivate let parser: InternalParser

    var body: any Parser<Void> {
        return neverBody()
    }
}

extension IgnoreRule: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: parser)
        if Source.Parsed.self != Void.self {
            _ = try scanner.pop(of: Source.Parsed.self)
        }
    }

}
