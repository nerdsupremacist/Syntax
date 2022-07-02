
import Foundation

public struct Group<Content : Parser>: Parser {
    private let content: Content

    public init(@ParserBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: any Parser<Content.Parsed> {
        return neverBody()
    }
}

extension Group: InternalParserBuilder {

    func buildParser<Context : InternalParserBuilderContext >(context: inout Context) -> InternalParser {
        return context.build(content)
    }

}
