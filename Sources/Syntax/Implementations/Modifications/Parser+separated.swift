
import Foundation

extension Parser {

    public func separated(by separator: String, allowTrailing: Bool = false) -> AnyParser<[Output]> {
        return Separated<Self, String>(parser: internalParser(), separator: separator.internalParser(), allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> AnyParser<[(Output, Separator.Output?)]> {
        return Separated<Self, Separator>(parser: internalParser(), separator: separator().internalParser(), allowTrailing: allowTrailing).eraseToAnyParser()
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> AnyParser<[Output]> where Separator.Output == Void {
        return Separated<Self, Separator>(parser: internalParser(), separator: separator().internalParser(), allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

}

private struct Separated<Source: Parser, Separator: Parser>: Parser {
    fileprivate let parser: InternalParser
    fileprivate let separator: InternalParser
    fileprivate let allowTrailing: Bool

    var body: AnyParser<[(Source.Output, Separator.Output?)]> {
        return neverBody()
    }
}

extension Separated: InternalParser {

    func prefixes() -> Set<String> {
        return parser.prefixes().union([""])
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        var values: [(Source.Output, Separator.Output?)] = []
        while (true) {
            scanner.begin()
            do {
                if !values.isEmpty {
                    try separator.parse(using: scanner)
                    let separatorOutput: Separator.Output
                    if Separator.Output.self != Void.self {
                        separatorOutput = try scanner.pop(of: Separator.Output.self)
                    } else {
                        separatorOutput = () as! Separator.Output
                    }

                    values[values.count - 1] = (values[values.count - 1].0, separatorOutput)
                }
                try parser.parse(using: scanner)
                let sourceOutput: Source.Output
                if Source.Output.self != Void.self {
                    sourceOutput = try scanner.pop(of: Source.Output.self)
                } else {
                    sourceOutput = () as! Source.Output
                }
                values.append((sourceOutput, nil))
                try scanner.commit()
            } catch {
                try scanner.rollback()
                break
            }
        }

        if !values.isEmpty && allowTrailing {
            try separator.parse(using: scanner)
            let separatorOutput: Separator.Output
            if Separator.Output.self != Void.self {
                separatorOutput = try scanner.pop(of: Separator.Output.self)
            } else {
                separatorOutput = () as! Separator.Output
            }

            values[values.count - 1] = (values[values.count - 1].0, separatorOutput)
        }

        scanner.store(value: Array(values))
        scanner.exitNode()
    }

}
