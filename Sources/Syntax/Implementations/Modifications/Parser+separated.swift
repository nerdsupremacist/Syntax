
import Foundation

extension Parser {

    public func separated(by separator: String, allowTrailing: Bool = false) -> some Parser<[Parsed]> {
        return Separated(content: self,
                         separator: separator,
                         allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> some Parser<[(Parsed, Separator.Parsed?)]> {
        return Separated(content: self, separator: separator(), allowTrailing: allowTrailing)
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> some Parser<[Parsed]> where Separator.Parsed == Void {
        return Separated(content: self, separator: separator(), allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

}

private struct Separated<Content : Parser, Separator : Parser>: Parser {
    fileprivate let content: Content
    fileprivate let separator: Separator
    fileprivate let allowTrailing: Bool

    var body: any Parser<[(Content.Parsed, Separator.Parsed?)]> {
        return neverBody()
    }
}

extension Separated: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        let content: InternalParser
        let separator: InternalParser
        let allowTrailing: Bool

        init(content: InternalParser, separator: InternalParser, allowTrailing: Bool) {
            self.content = content
            self.separator = separator
            self.allowTrailing = allowTrailing
        }

        func prefixes() -> Set<String> {
            return content.prefixes().union([""])
        }

        func parse(using scanner: Scanner) throws {
            try scanner.withNewNode { scanner in
                var values: [(Content.Parsed, Separator.Parsed?)] = []
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
                        try scanner.parse(using: content)
                        let sourceOutput: Content.Parsed
                        if Content.Parsed.self != Void.self {
                            sourceOutput = try scanner.pop(of: Content.Parsed.self)
                        } else {
                            sourceOutput = () as! Content.Parsed
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
            }
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content), separator: context.build(separator), allowTrailing: allowTrailing)
    }
}
