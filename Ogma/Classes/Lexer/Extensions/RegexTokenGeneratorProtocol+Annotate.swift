//
//  RegexTokenGeneratorProtocol+Annotate.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

extension RegexTokenGeneratorProtocol {

    public func annotate(text: String) throws -> AnnotatedString<Token?> {
        let expression = try NSRegularExpression(pattern: pattern)
        let matches = expression.matches(in: text, range: text.range)

        let annotations = try matches
            .map { ($0, try token(in: $0, for: text)) }
            .collect { lastAnnotation, tuple -> Annotation<Token?> in

                let (match, token) = tuple

                guard let rangeOfText = Range(match.range, in: text) else {
                    throw LexerError.noMatchFound(text, pattern: pattern)
                }

                let rangeOfLastText: Range<String.Index>?
                switch lastAnnotation {

                case .none where text.startIndex < rangeOfText.lowerBound:
                    rangeOfLastText = text.startIndex..<rangeOfText.lowerBound

                case .some(let annotation) where annotation.rangeOfText.upperBound < rangeOfText.lowerBound:
                    rangeOfLastText = annotation.rangeOfText.upperBound..<rangeOfText.lowerBound

                default:
                    rangeOfLastText = nil

                }

                return Annotation(rangeOfLastText: rangeOfLastText,
                                  rangeOfText: rangeOfText,
                                  text: String(text[rangeOfText]),
                                  token: token)
        }

        guard !annotations.isEmpty else { return [.text(text)] }

        return annotations.enumerated().flatMap { item -> AnnotatedString<Token?> in
            let annotation = item.element

            let isLast = item.offset == annotations.count - 1
            let hasNotReachedTheEnd = annotation.rangeOfText.upperBound < text.endIndex
            let endString = isLast && hasNotReachedTheEnd ? String(text[annotation.rangeOfText.upperBound...]) : nil

            return [
                annotation.rangeOfLastText.map { .text(String(text[$0])) },
                AnnotationElement.annotated(annotation.text, annotation.token),
                endString.map { .text($0) },
            ].compactMap { $0 }
        }
    }

}

private struct Annotation<Token> {
    let rangeOfLastText: Range<String.Index>?
    let rangeOfText: Range<String.Index>
    let text: String
    let token: Token
}
