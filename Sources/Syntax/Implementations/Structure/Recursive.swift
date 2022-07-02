
import Foundation

public class Recursive<Content : Parser>: Parser {
    public typealias Parsed = Content.Parsed

    private let content: (AnyParser<Parsed>) -> InternalParser

    // Prevent recursive calling of prefixes
    private var isComputingContent = false
    private lazy var _content: InternalParser = { [unowned self] in
        isComputingContent = true
        defer { isComputingContent = false }
        return content(eraseToAnyParser())
    }()

    init(of type: Parsed.Type = Parsed.self, content: @escaping (AnyParser<Parsed>) -> InternalParser) {
        self.content = content
    }

    public init(of type: Parsed.Type = Parsed.self, @ParserBuilder content: @escaping (AnyParser<Parsed>) -> Content) {
        self.content = { content($0).internalParser() }
    }

    public var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension Recursive: InternalParser {
    var id: UUID {
        return _content.id
    }

    func prefixes() -> Set<String> {
        if isComputingContent {
            return []
        }
        return _content.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: _content)
    }

    func wrapContent(with wrapper: @escaping (InternalParser) -> InternalParser) -> InternalParser {
        let content = self.content
        return Recursive<Content>(of: Content.Parsed.self) { wrapper(content($0)) }
    }
}
