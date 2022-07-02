
import Foundation

#if canImport(RegexBuilder)
import RegexBuilder

@available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
extension Regex: Parser {
    public typealias Parsed = Output

    public var body: any Parser<Parsed> {
        return RegexWrapperParser(self)
    }

}

@available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
private struct RegexWrapperParser<Parsed>: Parser {
    private let expression: Regex<Parsed>

    public init(_ expression: Regex<Parsed>) {
        self.expression = expression
    }

    public var body: any Parser<Parsed> {
        return neverBody()
    }
}

@available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
extension RegexWrapperParser: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        let expression: Regex<Parsed>

        init(expression: Regex<Parsed>) {
            self.expression = expression
        }

        func prefixes() -> Set<String> {
            return []
        }

        func parse(using scanner: Scanner) throws {
            try scanner.withNewNode { scanner in
                let match = try scanner.take(regex: expression)
                scanner.store(value: match.output)
            }
            scanner.configureNode(kind: .expressionMatch)
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(expression: expression)
    }
}

#endif
