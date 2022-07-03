
import Foundation
@_exported import SyntaxTree

public struct AnnotatedUntil<Content : Parser, End: Parser>: Parser {
    fileprivate enum AnnotationValue {
        case content(Content.Parsed)
        case end(End.Parsed)
    }

    private let content: Content
    private let end: End

    public init(@ParserBuilder content: () -> Content, @ParserBuilder end: () -> End) {
        self.content = content()
        self.end = end()
    }

    public var body: any Parser<(AnnotatedString<Content.Parsed>, End.Parsed)> {
        return neverBody()
    }
}

extension AnnotatedUntil: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let content: InternalParser
        let end: InternalParser

        init(content: InternalParser, end: InternalParser) {
            self.content = content
            self.end = end
        }
        
        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return .higher
        }

        func prefixes() -> Set<String> {
            return []
        }

        func parse(using scanner: Scanner) throws {
            scanner.beginScanning(in: scanner.range, clipToLast: true, for: AnnotationValue.self)
            
            try scanner.withNewNode { scanner in
                while (true) {
                    let nextContentRange = try scanner.range(for: content, content: Content.self, end: End.self)
                    let nextEndRange = try scanner.range(for: end, content: Content.self, end: End.self)

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
                        try scanner.parse(using: content)
                        try scanner.commit()
                        continue
                    }

                    break
                }
            }

            scanner.begin()
            try scanner.parse(using: end)
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

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content.map(AnnotationValue.content)),
                       end: context.build(end.map(AnnotationValue.end)))
    }
}

extension Scanner {

    fileprivate func range<Content : Parser, End: Parser>(for parser: InternalParser, content: Content.Type, end: End.Type) throws -> Range<Location>? {
        begin()
        enterNode()
        do {
            try parse(using: parser)
            exitNode()
        } catch {
            exitNode()
            try rollback()
            return nil
        }

        let range = locationOfNode()
        try rollback()
        return range
    }

}
