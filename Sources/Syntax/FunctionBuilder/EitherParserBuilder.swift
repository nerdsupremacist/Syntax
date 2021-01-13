
import Foundation

@_functionBuilder
public struct EitherParserBuilder {
    public static func buildExpression<C0: Parser>(_ c0: C0) -> AnyParser<C0.Output> {
        return c0.eraseToAnyParser()
    }

    public static func buildBlock() -> AnyParser<Void> {
        return EmptyParser().ignoreOutput()
    }

    public static func buildBlock<Output>(_ parsers: AnyParser<Output>...) -> [AnyParser<Output>] {
        return parsers
    }
}
