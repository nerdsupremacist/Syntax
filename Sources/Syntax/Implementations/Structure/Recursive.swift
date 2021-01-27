
import Foundation

public class Recursive<Content : Parser>: Parser {
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
    var id: UUID {
        return _content.id
    }

    func prefixes() -> Set<String> {
        return _content.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: _content)
    }
}
