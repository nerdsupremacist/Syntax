
import Foundation

extension Parser {

    public func star() -> some Parser<[Parsed]> {
        return self.repeat(min: nil, max: nil)
    }

    public func plus() -> some Parser<[Parsed]> {
        return self.repeat(min: 1, max: nil)
    }

    public func `repeat`(min: UInt? = nil, max: UInt? = nil) -> some Parser<[Parsed]> {
        return Repeat(min: min, max: max) { self }
    }

}

extension Parser where Parsed == Void {

    public func star() -> some Parser<Void> {
        return self.repeat(min: nil, max: nil)
    }

    public func plus() -> some Parser<Void> {
        return self.repeat(min: 1, max: nil)
    }

    public func `repeat`(min: UInt? = nil, max: UInt? = nil) -> some Parser<Void> {
        return Repeat(min: min, max: max) { self }.ignoreOutput()
    }

}

public struct Repeat<Content : Parser>: Parser {
    private let min: UInt?
    private let max: UInt?
    private let content: Content

    public init(min: UInt? = nil, max: UInt? = nil, @ParserBuilder content: () -> Content) {
        self.min = min
        self.max = max
        self.content = content()
    }
    
    public var body: any Parser<[Content.Parsed]> {
        return neverBody()
    }
}

extension Repeat: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id = UUID()
        private let min: UInt?
        private let max: UInt?
        private let content: InternalParser

        init(min: UInt?, max: UInt?, content: InternalParser) {
            self.min = min
            self.max = max
            self.content = content
        }

        func prefixes() -> Set<String> {
            if let min = min, min > 0 {
                return content.prefixes()
            } else {
                return content.prefixes().union([""])
            }
        }

        func parse(using scanner: Scanner) throws {
            scanner.enterNode()
            var count = 0
            if let min = min {
                for _ in 0..<min {
                    try scanner.parse(using: content)
                    count += 1
                }
            }

            while (max.map { $0 > count } ?? true) {
                let index = scanner.range.lowerBound
                scanner.begin()
                do {
                    try scanner.parse(using: content)

                    if scanner.range.lowerBound <= index {
                        try scanner.rollback()
                        break
                    }

                    try scanner.commit()
                    count += 1
                } catch {
                    try scanner.rollback()
                    break
                }
            }

            if Content.Parsed.self != Void.self {
                let values = try (0..<count).map { _ in try scanner.pop(of: Content.Parsed.self) }.reversed()
                scanner.store(value: Array(values))
            } else {
                scanner.store(value: [])
            }

            scanner.exitNode()
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(min: min, max: max, content: context.build(content))
    }
}
