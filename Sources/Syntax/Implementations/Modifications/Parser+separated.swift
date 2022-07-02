
import Foundation

extension Parser {

    public func separated(by separator: String, allowTrailing: Bool = false) -> AnyParser<[Parsed]> {
        return Separated<Self, String>(parser: internalParser(),
                                       separator: separator.internalParser(),
                                       allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> AnyParser<[(Parsed, Separator.Parsed?)]> {
        return Separated<Self, Separator>(parser: internalParser(), separator: separator().internalParser(), allowTrailing: allowTrailing).eraseToAnyParser()
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> AnyParser<[Parsed]> where Separator.Parsed == Void {
        return Separated<Self, Separator>(parser: internalParser(), separator: separator().internalParser(), allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

}

private struct Separated<Source: Parser, Separator: Parser>: Parser {
    let id = UUID()
    fileprivate let parser: InternalParser
    fileprivate let separator: InternalParser
    fileprivate let allowTrailing: Bool

    var body: any Parser<[(Source.Parsed, Separator.Parsed?)]> {
        return neverBody()
    }
}

extension Separated: InternalParser {

    func prefixes() -> Set<String> {
        return parser.prefixes().union([""])
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        var values: [(Source.Parsed, Separator.Parsed?)] = []
        while (true) {
            scanner.begin()
            do {
                if !values.isEmpty {
                    try scanner.parse(using: separator)
                    let separatorOutput: Separator.Parsed
                    if Separator.Parsed.self != Void.self {
                        separatorOutput = try scanner.pop(of: Separator.Parsed.self)
                    } else {
                        separatorOutput = () as! Separator.Parsed
                    }

                    values[values.count - 1] = (values[values.count - 1].0, separatorOutput)
                }
                try scanner.parse(using: parser)
                let sourceOutput: Source.Parsed
                if Source.Parsed.self != Void.self {
                    sourceOutput = try scanner.pop(of: Source.Parsed.self)
                } else {
                    sourceOutput = () as! Source.Parsed
                }
                values.append((sourceOutput, nil))
                try scanner.commit()
            } catch {
                try scanner.rollback()
                break
            }
        }

        if !values.isEmpty && allowTrailing {
            try scanner.parse(using: separator)
            let separatorOutput: Separator.Parsed
            if Separator.Parsed.self != Void.self {
                separatorOutput = try scanner.pop(of: Separator.Parsed.self)
            } else {
                separatorOutput = () as! Separator.Parsed
            }

            values[values.count - 1] = (values[values.count - 1].0, separatorOutput)
        }

        scanner.store(value: Array(values))
        scanner.exitNode()
    }

}
