
import Foundation

public struct AnyParser<Parsed>: Parser {
    let builder: InternalParserBuilder

    init(_ builder: InternalParserBuilder) {
        if let parser = builder as? AnyParser<Parsed> {
            self.builder = parser.builder
        } else {
            self.builder = builder
        }
    }

    public init<Content : Parser>(_ content: Content) where Content.Parsed == Parsed {
        let builder = content.internalParserBuilder()
        self.init(builder)
    }
    
    public var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension AnyParser: InternalParserBuilder {
    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return context.build(using: builder)
    }
}

extension Parser {

    public func eraseToAnyParser() -> AnyParser<Parsed> {
        return AnyParser(self)
    }

}
