
import Foundation

public struct EmptyParserBuilderExpression<P : Parser> where P.Parsed == Void {
    let parser: P
}

public struct ParserBuilderExpression<P : Parser> {
    let parser: P
}
