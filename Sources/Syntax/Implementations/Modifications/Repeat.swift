
import Foundation

extension Parser {

    public func star() -> any Parser<[Parsed]> {
        return self.repeat(min: nil, max: nil)
    }

    public func plus() -> any Parser<[Parsed]> {
        return self.repeat(min: 1, max: nil)
    }

    public func `repeat`(min: UInt? = nil, max: UInt? = nil) -> any Parser<[Parsed]> {
        return Repeat(min: min, max: max) { self }
    }

}

extension Parser where Parsed == Void {

    public func star() -> any Parser<Void> {
        return self.repeat(min: nil, max: nil)
    }

    public func plus() -> any Parser<Void> {
        return self.repeat(min: 1, max: nil)
    }

    public func `repeat`(min: UInt? = nil, max: UInt? = nil) -> any Parser<Void> {
        return Repeat(min: min, max: max) { self }.ignoreOutput()
    }

}

public struct Repeat<Element>: Parser {
    let id = UUID()
    private let min: UInt?
    private let max: UInt?
    private let parser: InternalParser

    public init<Content : Parser>(min: UInt? = nil, max: UInt? = nil, @ParserBuilder content: () -> Content) where Content.Parsed == Element {
        self.min = min
        self.max = max
        self.parser = content().internalParser()
    }
    
    public var body: any Parser<[Element]> {
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
                try scanner.parse(using: parser)
                count += 1
            }
        }

        while (max.map { $0 > count } ?? true) {
            let index = scanner.range.lowerBound
            scanner.begin()
            do {
                try scanner.parse(using: parser)

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

        if Element.self != Void.self {
            let values = try (0..<count).map { _ in try scanner.pop(of: Element.self) }.reversed()
            scanner.store(value: Array(values))
        } else {
            scanner.store(value: [])
        }

        scanner.exitNode()
    }

}
