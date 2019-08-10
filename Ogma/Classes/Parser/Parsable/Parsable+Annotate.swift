//
//  Parsable+Annotate.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

public struct ParsedAnnotation<Value, Token: TokenProtocol> {
    public let value: Value
    public let annotatedString: AnnotatedString<Token>
}

extension Parsable {

    public typealias Annotated = AnnotatedString<ParsedAnnotation<Self, Token>>

    public static func annotate<L: LexerProtocol>(
        _ input: String,
        using lexer: L.Type
    ) throws -> AnnotatedString<Self> where L.Token == Token {

        return try detailedAnnotation(input, using: lexer).map { $0.value }
    }

    public static func detailedAnnotation<L: LexerProtocol>(
        _ input: String,
        using lexer: L.Type
    ) throws -> Annotated where L.Token == Token {

        return try lexer
            .annotate(input)
            .groups()
            .flatMap { element -> Annotated in
                switch element {
                case .text(let text):
                    return [.text(text)]
                case .annotations(let annotations):
                    return string(parsing: annotations)
                }
            }
            .clean()
    }

}

extension Parsable {

    private typealias OptionalTokenGroup = [AnnotatedGroup<Token?>.Annotation]

    private static func string(parsing group: OptionalTokenGroup) -> Annotated {
        let start = group.prefix { $0.annotation == nil }
        let end = group.reversed().prefix { $0.annotation == nil }.reversed()

        guard start.count < group.count else { return group.map { .text($0.text) } }

        let group = Array(group.dropFirst(start.count).dropLast(end.count))

        return start.map { .text($0.text) } +
            attempt(parsing: group) +
            end.map { .text($0.text) }
    }

    private static func attempt(parsing group: OptionalTokenGroup) -> Annotated {
        let tokens = group.map { $0.annotation }
        do {
            let output = try parser.parse(tokens: tokens)
            let tokensTaken = tokens.count - output.remaining.count
            let text = group.dropLast(output.remaining.count).reduce("") { $0 + $1.text }

            let tokensRead = Array(group.dropLast(output.remaining.count))
                .map { AnnotationElement.annotated($0.text, $0.annotation) }
                .compactMap { $0 }
            let parsed = ParsedAnnotation(value: output.output, annotatedString: tokensRead)

            if tokensTaken < tokens.count {
                let remaining = tokensTaken != tokens.count ? Array(group.dropFirst(tokensTaken)) : []
                return [.annotated(text, parsed)] + attempt(parsing: remaining)
            } else {
                return [.annotated(text, parsed)]
            }
        } catch {
            guard let head = group.first else { return [] }
            let remaining = Array(group.dropFirst())
            return [.text(head.text)] + attempt(parsing: remaining)
        }
    }

}
