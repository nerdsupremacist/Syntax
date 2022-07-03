
import Foundation

extension Parser {

    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> some Parser<[Parsed]> where Content.Parsed == Void {
        return RepeatUntil(content: self, end: end()).map { $0.0 }
    }

    @_disfavoredOverload
    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> some Parser<([Parsed], Content.Parsed)> {
        return RepeatUntil(content: self, end: end())
    }

}

extension Parser where Parsed == Void {

    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> some Parser<Void> where Content.Parsed == Void {
        return RepeatUntil(content: self, end: end()).ignoreOutput()
    }

    @_disfavoredOverload
    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> some Parser<Content.Parsed> {
        return RepeatUntil(content: self, end: end()).map { $1 }
    }

}

private struct RepeatUntil<Content : Parser, End : Parser>: Parser {
    let content: Content
    let end: End

    var body: any Parser<([Content.Parsed], End.Parsed)> {
        return neverBody()
    }
}

extension RepeatUntil: InternalParserBuilder {

    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let content: InternalParser
        let end: InternalParser

        init(content: InternalParser, end: InternalParser) {
            self.content = content
            self.end = end
        }
        
        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return .separate
        }

        func prefixes() -> Set<String> {
            return content.prefixes().union([""])
        }

        func parse(using scanner: Scanner) throws {
            try scanner.withNewNode { scanner in
                var count = 0

                while (true) {
                    let index = scanner.range.lowerBound
                    let hasParsedEnd: Bool = scanner.attempt { scanner in
                        try scanner.parse(using: self.end)
                    }

                    if hasParsedEnd {
                        break
                    }

                    scanner.begin()
                    do {
                        try scanner.parse(using: content)

                        if scanner.range.lowerBound <= index {
                            try scanner.rollback()
                            break
                        }

                        try scanner.commit()
                        count += 1
                    } catch {
                        try scanner.rollback()
                        try scanner.parse(using: end)
                        break
                    }
                }

                let end: End.Parsed
                if End.Parsed.self != Void.self {
                    end = try scanner.pop(of: End.Parsed.self)
                } else {
                    end = () as! End.Parsed
                }

                let values: [Content.Parsed]
                if Content.Parsed.self != Void.self {
                    values = try (0..<count).map { _ in try scanner.pop(of: Content.Parsed.self) }.reversed()
                } else {
                    values = []
                }

                scanner.store(value: (values, end))
            }
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content), end: context.build(end))
    }
}
