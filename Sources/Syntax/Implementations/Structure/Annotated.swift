
import Foundation

public struct AnnotatedString<Value>: CustomStringConvertible {
    public struct Annotation {
        let range: Range<String.Index>
        let value: Value
    }

    public enum Part {
        case text(Substring)
        case annotated(original: Substring, value: Value)
    }

    public let text: Substring
    public let annotations: [Annotation]

    public func parts() -> [Part] {
        var parts = [Part]()

        var lastIndex = text.startIndex
        for annotation in annotations {
            let prefixRange = lastIndex..<annotation.range.lowerBound
            if !prefixRange.isEmpty {
                parts.append(.text(text[prefixRange]))
            }

            parts.append(.annotated(original: text[annotation.range], value: annotation.value))

            lastIndex = annotation.range.upperBound
        }

        let postfixRange = lastIndex..<text.endIndex
        if !postfixRange.isEmpty {
            parts.append(.text(text[postfixRange]))
        }

        return parts
    }

    public func string<S : StringProtocol>(_ transform: (Substring, Value) throws -> S) rethrows -> String {
        var string = ""

        for part in parts() {
            switch part {
            case .text(let substring):
                string += substring
            case .annotated(let substring, let value):
                let newValue = try transform(substring, value)
                string += newValue
            }
        }

        return string
    }

    public func string<S : StringProtocol>(_ transform: (Value) throws -> S) rethrows -> String {
        return try string { _, value in try transform(value) }
    }

    public var description: String {
        return string { "\($0)" }
    }
}

public struct Annotated<Content : Parser>: Parser {
    let id = UUID()
    let pattern: String?
    let parser: InternalParser

    public init(pattern: String, @ParserBuilder content: () -> Content) {
        self.pattern = pattern
        self.parser = content().internalParser()
    }

    public init(@ParserBuilder content: () -> Content) {
        self.pattern = nil
        self.parser = content().internalParser()
    }

    public var body: AnyParser<AnnotatedString<Content.Output>> {
        return neverBody()
    }
}

extension Annotated: InternalParser {

    func prefixes() -> Set<String> {
        return []
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()

        if let pattern = pattern {
            let match = try scanner.take(pattern: pattern)
            scanner.beginScanning(in: match.range, for: Content.Output.self)
        } else {
            scanner.beginScanning(in: scanner.range, for: Content.Output.self)
        }

        while (true) {
            scanner.begin()
            do {
                try parser.parse(using: scanner)
                try scanner.commit()
                try scanner.commit()
            } catch {
                scanner.exitNode()
                try scanner.rollback()
                break
            }
        }

        try scanner.commit()
        scanner.exitNode()
    }

}
