//
//  RegexTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// A TokenGenerator that matches the beginning of the String if it matches a Regular Expression
public protocol RegexTokenGeneratorProtocol: TokenGenerator {
    var pattern: String { get }
    var group: Int { get }
    func token(from matched: String) throws -> Token?
}

extension RegexTokenGeneratorProtocol {

    public var group: Int {
        return 0
    }

}

extension RegexTokenGeneratorProtocol {

    public func take(text: String) throws -> Result {
        let expression = try NSRegularExpression(pattern: "^\(pattern)")

        guard let match = expression.firstMatch(in: text, range: text.range),
            let matchRange = Range(match.range, in: text),
            matchRange.lowerBound == text.startIndex else {

            throw LexerError.noMatchFound(text, pattern: pattern)
        }

        let remaining = matchRange.upperBound < text.endIndex ? String(text[matchRange.upperBound...]) : nil

        return TokenResult(token: try token(in: match, for: text),
                           remainingString: remaining)
    }
    
}

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

extension RegexTokenGeneratorProtocol {

    private func token(in match: NSTextCheckingResult, for text: String) throws -> Token? {
        let groupRange = match.range(at: group)

        guard let range = Range(groupRange, in: text) else {
            throw LexerError.noMatchFound(text, pattern: pattern)
        }

        let matched = String(text[range])

        do {
            return try token(from: matched)
        } catch let error as LexerError {
            throw error
        } catch {
            throw LexerError.cannotMap(matched, dueTo: error, generator: Self.self)
        }
    }

}

private struct Annotation<Token> {
    let rangeOfLastText: Range<String.Index>?
    let rangeOfText: Range<String.Index>
    let text: String
    let token: Token
}
