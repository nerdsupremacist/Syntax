
import Foundation

public struct IfElseConditionalParser<A : Parser, B : Parser>: Parser where A.Parsed == B.Parsed {
    let builder: InternalParserBuilder

    init(_ a: A) {
        builder = a.internalParserBuilder()
    }

    init(_ b: B) {
        builder = b.internalParserBuilder()
    }

    public var body: any Parser<A.Parsed> {
        return neverBody()
    }
}

extension IfElseConditionalParser: InternalParserBuilder {
    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return context.build(using: builder)
    }
}
