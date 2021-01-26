
import Foundation

public class Recursive<Content : Parser>: Parser, Identified {
    public let id = UUID()
    private let content: (AnyParser<Output>) -> Content
    private lazy var _content: InternalParser = { [unowned self] in
        return content(eraseToAnyParser()).internalParser()
    }()

    public init(of type: Output.Type = Output.self, @ParserBuilder content: @escaping (AnyParser<Output>) -> Content) {
        self.content = content
    }

    public var body: AnyParser<Content.Output> {
        return neverBody()
    }
}

extension Recursive: InternalParser {
    func prefixes() -> Set<String> {
        return []
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: _content)
    }

}
