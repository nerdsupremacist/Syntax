
import Foundation

#if canImport(RegexBuilder)
import RegexBuilder

@available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
extension Regex: Parser {
    public typealias Parsed = Output

    public var body: AnyParser<Parsed> {
        return RegexWrapperParser(self).eraseToAnyParser()
    }

}

@available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
private struct RegexWrapperParser<Parsed>: Parser, Hashable {
    let id = UUID()
    private let expression: Regex<Parsed>

    public init(_ expression: Regex<Parsed>) {
        self.expression = expression
    }

    public var body: AnyParser<Parsed> {
        return neverBody()
    }

    public static func == (lhs: RegexWrapperParser<Parsed>, rhs: RegexWrapperParser<Parsed>) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

@available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
extension RegexWrapperParser: InternalParser {

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        let match = try scanner.take(regex: expression)
        scanner.store(value: match.output)
        scanner.exitNode()
        scanner.configureNode(kind: .expressionMatch)
    }

    func prefixes() -> Set<String> {
        return []
    }
}

#endif
