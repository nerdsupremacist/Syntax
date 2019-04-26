//
//  RegexTokenGeneratorProtocol+Annotate.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

extension RegexTokenGeneratorProtocol {

    public func annotate(text: String) throws -> AnnotatedString<Token?> {
        let annotations = try self.annotations(in: text)

        guard !annotations.isEmpty else { return [.text(text)] }

        let lastRange = annotations
            .last
            .filter { $0.range.upperBound < text.endIndex }
            .map { $0.range.upperBound..<text.endIndex }

        let string = annotations.flatMap { $0.annotatedString }

        return string +
            [lastRange.map { .text(String(text[$0])) }].compactMap { $0 }
    }

}

extension RegexTokenGeneratorProtocol {

    private func annotations(in text: String) throws -> [Annotation<Token?>] {
        let expression = try NSRegularExpression(pattern: pattern)
        let matches = expression.matches(in: text, range: text.range)

        return try matches
            .map { ($0, try token(in: $0, for: text)) }
            .collect { lastAnnotation, tuple -> Annotation<Token?> in

                let (match, token) = tuple

                guard let range = Range(match.range, in: text) else {
                    throw LexerError.noMatchFound(text, pattern: pattern)
                }

                return Annotation(lastText: text[between: lastAnnotation?.range, and: range],
                                  range: range,
                                  text: String(text[range]),
                                  token: token)
        }
    }

}

private struct Annotation<Token> {
    let lastText: String?
    let range: Range<String.Index>
    let text: String
    let token: Token
}

extension Annotation {

    var annotatedString: AnnotatedString<Token> {
        return [
            lastText.map { .text($0) },
            AnnotationElement.annotated(text, token),
        ].compactMap { $0 }
    }

}

extension String {

    fileprivate subscript(between last: Range<String.Index>?, and next: Range<String.Index>) -> String? {
        return range(between: last, and: next).map { String(self[$0]) }
    }

    fileprivate func range(between last: Range<String.Index>?,
                           and next: Range<String.Index>) -> Range<String.Index>? {

        switch last {
        case .none where startIndex < next.lowerBound:
            return startIndex..<next.lowerBound
        case .some(let last) where last.upperBound < next.lowerBound:
            return last.upperBound..<next.lowerBound
        default:
            return nil
        }
    }

}
