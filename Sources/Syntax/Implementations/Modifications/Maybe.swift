
import Foundation

extension Parser {

    public func maybe() -> AnyParser<Output?> {
        return Maybe(content: internalParser()).eraseToAnyParser()
    }

    public func maybe(default defaultOutput: Output) -> AnyParser<Output> {
        return Maybe(content: internalParser()).map { $0 ?? defaultOutput }
    }

    public func maybe(default defaultOutput: Output?) -> AnyParser<Output?> {
        return Maybe(content: internalParser()).map { $0 ?? defaultOutput }
    }

}

public struct Maybe<Wrapped>: Parser {
    let id = UUID()
    fileprivate let content: InternalParser

    public var body: AnyParser<Wrapped?> {
        return neverBody()
    }
}

extension Maybe {

    public init<Content : Parser>(@ParserBuilder content: () -> Content) where Content.Output == Wrapped {
        self.content = content().internalParser()
    }

}

extension Maybe: InternalParser {

    func prefixes() -> Set<String> {
        return content.prefixes().union([""])
    }

    func parse(using scanner: Scanner) throws {
        scanner.begin()
        do {
            try scanner.parse(using: content)
            try scanner.commit()
        } catch {
            try scanner.rollback()
            scanner.store(value: nil as Output)
        }
    }

}
