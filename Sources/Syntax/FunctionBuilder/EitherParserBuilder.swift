
import Foundation

@resultBuilder
public struct EitherParserBuilder {
    public static func buildExpression<T>(_ parser: any Parser<T>) -> AnyParser<T> {
        return parser.eraseToAnyParser()
    }

    public static func buildExpression<C0: Parser>(_ c0: C0) -> AnyParser<C0.Parsed> {
        return c0.eraseToAnyParser()
    }

    public static func buildBlock() -> AnyParser<Void> {
        return EmptyParser().eraseToAnyParser()
    }

    public static func buildBlock<Parsed>(_ parsers: AnyParser<Parsed>...) -> [AnyParser<Parsed>] {
        return parsers
    }
}
