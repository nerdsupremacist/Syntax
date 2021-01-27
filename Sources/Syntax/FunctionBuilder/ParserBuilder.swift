import Foundation

@_functionBuilder
public struct ParserBuilder {

    public static func buildExpression<P: Parser>(_ parser: P) -> PartialEmptyParserResult where P.Output == Void {
        return PartialEmptyParserResult(parser: parser.internalParser())
    }

    @_disfavoredOverload
    public static func buildExpression<P: Parser>(_ parser: P) -> PartialParserResult<P.Output> {
        return PartialParserResult(parser: parser.internalParser(), outputType: P.Output.self)
    }
}

extension ParserBuilder {
    public static func buildEither(first: PartialEmptyParserResult) -> PartialEmptyParserResult {
        return first
    }

    public static func buildEither(second: PartialEmptyParserResult) -> PartialEmptyParserResult {
        return second
    }

    public static func buildEither<Output>(first: PartialParserResult<Output>) -> PartialParserResult<Output> {
        return first
    }

    public static func buildEither<Output>(second: PartialParserResult<Output>) -> PartialParserResult<Output> {
        return second
    }
}

extension ParserBuilder {

    public static func buildBlock() -> AnyParser<Void> {
        return EmptyParser().eraseToAnyParser()
    }

    public static func buildBlock(_ a: PartialEmptyParserResult) -> AnyParser<Void> {
        return AnyParser(a.parser)
    }

    public static func buildBlock<A>(_ a: PartialParserResult<A>) -> AnyParser<A> {
        return AnyParser(a.parser)
    }

}

extension ParserBuilder {

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>) -> AnyParser<(C0, C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>) -> AnyParser<(C0, C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>) -> AnyParser<(C0, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>) -> AnyParser<(C0, C3)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>) -> AnyParser<(C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>) -> AnyParser<(C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>) -> AnyParser<(C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>) -> AnyParser<C3> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2, c3).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<(C0, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<(C0, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<(C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<(C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<(C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<(C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<(C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>) -> AnyParser<(C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult) -> AnyParser<C3> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>) -> AnyParser<C4> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2, c3, c4).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C0, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C0, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<(C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<(C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<(C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<C3> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>) -> AnyParser<(C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult) -> AnyParser<C4> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>) -> AnyParser<C5> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C0, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C0, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<(C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<C3> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<(C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<(C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<C4> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>) -> AnyParser<(C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult) -> AnyParser<C5> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>) -> AnyParser<C6> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C1, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C0, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C0, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C1, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<C3> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<(C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<C4> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<(C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<(C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<C5> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>) -> AnyParser<(C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult) -> AnyParser<C6> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>) -> AnyParser<C7> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C1, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C0, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C0, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C1, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C1, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<C3> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<C4> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<(C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<C5> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<(C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<(C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<C6> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>) -> AnyParser<(C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult) -> AnyParser<C7> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>) -> AnyParser<C8> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C2, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C1, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C1>(_ c0: PartialParserResult<C0>, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C1)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C2, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C2>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C3>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C4>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C5>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C6>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C7, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C7, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C7, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C7>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C8, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C8>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C0, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0, C9>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C0, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C0>(_ c0: PartialParserResult<C0>, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C0> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C2, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C2>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C2)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C1, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C1, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C1>(_ c0: PartialEmptyParserResult, _ c1: PartialParserResult<C1>, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C1> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C3)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C2, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C2, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C2>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialParserResult<C2>, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C2> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C4)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C3, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C3, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C3>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialParserResult<C3>, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C3> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C5)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C4, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C4, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C4>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialParserResult<C4>, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C4> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C5, C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C5, C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C5, C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C5, C6)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C5, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C5, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C5, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C5, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C5>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialParserResult<C5>, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C5> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6, C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C6, C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6, C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C6, C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6, C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C6, C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6, C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<(C6, C7)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C6, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C6, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C6, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C6>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialParserResult<C6>, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C6> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C7, C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C7, C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C7, C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<(C7, C8)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C7, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<(C7, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C7>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialParserResult<C7>, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<C7> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C8, C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialParserResult<C9>) -> AnyParser<(C8, C9)> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C8>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialParserResult<C8>, _ c9: PartialEmptyParserResult) -> AnyParser<C8> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock<C9>(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialParserResult<C9>) -> AnyParser<C9> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

    public static func buildBlock(_ c0: PartialEmptyParserResult, _ c1: PartialEmptyParserResult, _ c2: PartialEmptyParserResult, _ c3: PartialEmptyParserResult, _ c4: PartialEmptyParserResult, _ c5: PartialEmptyParserResult, _ c6: PartialEmptyParserResult, _ c7: PartialEmptyParserResult, _ c8: PartialEmptyParserResult, _ c9: PartialEmptyParserResult) -> AnyParser<Void> {
        return TupleParser(partials: c0, c1, c2, c3, c4, c5, c6, c7, c8, c9).eraseToAnyParser()
    }

}
