
import Foundation
@_exported import SyntaxTree

public struct AnnotatedUntil<Content : Parser, End: Parser>: Parser {
    private enum AnnotationValue {
        case content(Content.Parsed)
        case end(End.Parsed)
    }

    let id = UUID()

    let content: InternalParser
    let end: InternalParser

    public init(@ParserBuilder content: () -> Content, @ParserBuilder end: () -> End) {
        self.content = content().map(AnnotationValue.content).internalParser()
        self.end = end().map(AnnotationValue.end).internalParser()
    }

    public var body: any Parser<(AnnotatedString<Content.Parsed>, End.Parsed)> {
        return neverBody()
    }
}

extension AnnotatedUntil: InternalParser {

    func prefixes() -> Set<String> {
        return []
    }

    func parse(using scanner: Scanner) throws {
        scanner.beginScanning(in: scanner.range, clipToLast: true, for: AnnotationValue.self)
        scanner.enterNode()

        while (true) {
            let nextContentRange = try scanner.range(for: content)
            let nextEndRange = try scanner.range(for: end)

            switch (nextContentRange, nextEndRange) {

            case (.none, .none), (.none, .some):
                break

            case (.some(let nextContentRange), .some(let nextEndRange)):
                if nextContentRange.lowerBound >= nextEndRange.lowerBound {
                    break
                } else {
                    fallthrough
                }

            default:
                scanner.begin()
                try content.parse(using: scanner)
                try scanner.commit()
                continue
            }

            break
        }

        scanner.exitNode()
        scanner.begin()
        try end.parse(using: scanner)
        try scanner.commit()

        try scanner.commit()

        let annotatedString = try scanner.pop(of: AnnotatedString<AnnotationValue>.self)
        let last = annotatedString.annotations.last!

        let text = annotatedString.text[..<last.range.lowerBound]

        guard case .end(let end) = last.value else { fatalError() }

        let annotations = annotatedString.annotations.dropLast().map { annotation -> AnnotatedString<Content.Parsed>.Annotation in
            guard case .content(let content) = annotation.value else { fatalError() }
            return AnnotatedString<Content.Parsed>.Annotation(range: annotation.range, value: content)
        }

        let newString = AnnotatedString(text: text, annotations: annotations)
        scanner.store(value: (newString, end))
    }

}

extension Scanner {

    fileprivate func range(for parser: InternalParser) throws -> Range<Location>? {
        begin()
        enterNode()
        do {
            try parser.parse(using: self)
            exitNode()
        } catch {
            try rollback()
            return nil
        }

        let range = locationOfNode()
        try rollback()
        return range
    }

}
