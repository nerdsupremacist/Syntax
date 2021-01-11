
import Foundation

public struct Group<Content : Parser>: Parser {
    private let content: Content

    public init(@ParserBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: AnyParser<Content.Output> {
        content
    }
}
