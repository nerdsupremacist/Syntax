
import Foundation

extension Parser {

    public func star() -> AnyParser<[Output]> {
        return self.repeat(min: nil, max: nil)
    }

    public func plus() -> AnyParser<[Output]> {
        return self.repeat(min: 1, max: nil)
    }

    public func `repeat`(min: UInt? = nil, max: UInt? = nil) -> AnyParser<[Output]> {
        return Repeat(min: min, max: max) { self }.eraseToAnyParser()
    }

}

extension Parser where Output == Void {

    public func star() -> AnyParser<Void> {
        return self.repeat(min: nil, max: nil)
    }

    public func plus() -> AnyParser<Void> {
        return self.repeat(min: 1, max: nil)
    }

    public func `repeat`(min: UInt? = nil, max: UInt? = nil) -> AnyParser<Void> {
        return Repeat(min: min, max: max) { self }.ignoreOutput()
    }

}

public struct Repeat<Element>: Parser {
    private let min: UInt?
    private let max: UInt?
    private let parser: InternalParser

    public init<Content : Parser>(min: UInt? = nil, max: UInt? = nil, @ParserBuilder content: () -> Content) where Content.Output == Element {
        self.min = min
        self.max = max
        self.parser = content().internalParser()
    }
    
    public var body: AnyParser<[Element]> {
        return neverBody()
    }
}

extension Repeat: InternalParser {
    func prefixes() -> Set<String> {
        if let min = min, min > 0 {
            return parser.prefixes()
        } else {
            return parser.prefixes().union([""])
        }
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        var count = 0
        if let min = min {
            for _ in 0..<min {
                try parser.parse(using: scanner)
                count += 1
            }
        }

        while (max.map { $0 > count } ?? true) {
            let index = scanner.index
            scanner.begin()
            do {
                try parser.parse(using: scanner)

                if scanner.index <= index {
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

        if Element.self != Void.self {
            let values = try (0..<count).map { _ in try scanner.pop(of: Element.self) }.reversed()
            scanner.store(value: Array(values))
        }
        scanner.exitNode()
    }

}
