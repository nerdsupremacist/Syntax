
import Foundation

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
