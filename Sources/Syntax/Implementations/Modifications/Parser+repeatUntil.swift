
import Foundation

extension Parser {

    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> AnyParser<[Output]> where Content.Output == Void {
        return RepeatUntil<Output, Void>(parser: internalParser(), end: end().internalParser()).map { $0.0 }
    }

    @_disfavoredOverload
    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> AnyParser<([Output], Content.Output)> {
        return RepeatUntil(parser: internalParser(), end: end().internalParser()).eraseToAnyParser()
    }

}

extension Parser where Output == Void {

    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> AnyParser<Void> where Content.Output == Void {
        return RepeatUntil<Void, Void>(parser: internalParser(), end: end().internalParser()).ignoreOutput()
    }

    @_disfavoredOverload
    public func repeatUntil<Content : Parser>(@ParserBuilder end: () -> Content) -> AnyParser<Content.Output> {
        return RepeatUntil<Void, Content.Output>(parser: internalParser(), end: end().internalParser()).map { $1 }
    }

}

private struct RepeatUntil<Element, End>: Parser, Identified {
    public let id = UUID()
    let parser: InternalParser
    let end: InternalParser

    var body: AnyParser<([Element], End)> {
        return neverBody()
    }
}

extension RepeatUntil: InternalParser {
    func prefixes() -> Set<String> {
        return parser.prefixes().union([""])
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        var count = 0

        while (true) {
            let index = scanner.index
            scanner.begin()
            do {
                try scanner.parse(using: end)
                try scanner.commit()
                break
            } catch { }
            try scanner.rollback()

            scanner.begin()
            do {
                try scanner.parse(using: parser)

                if scanner.index <= index {
                    try scanner.rollback()
                    break
                }

                try scanner.commit()
                count += 1
            } catch {
                try scanner.rollback()
                try scanner.parse(using: end)
                break
            }
        }

        let end: End
        if End.self != Void.self {
            end = try scanner.pop(of: End.self)
        } else {
            end = () as! End
        }

        let values: [Element]
        if Element.self != Void.self {
            values = try (0..<count).map { _ in try scanner.pop(of: Element.self) }.reversed()
        } else {
            values = []
        }

        scanner.store(value: (values, end))
        scanner.exitNode()
    }

}
