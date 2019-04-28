//
//  Parsable+Annotate.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

extension Parsable {

    public static func annotate<L: LexerProtocol>(
        _ input: String,
        using lexer: L.Type
    ) throws -> AnnotatedString<Self> where L.Token == Token {

        return try lexer
            .annotate(input)
            .groups()
            .flatMap { element -> AnnotatedString<Self> in
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

    private static func string(parsing group: OptionalTokenGroup) -> AnnotatedString<Self> {
        let start = group.prefix { $0.annotation == nil }
        let end = group.reversed().prefix { $0.annotation == nil }.reversed()

        guard start.count < group.count else { return group.map { .text($0.text) } }

        let group = Array(group.dropFirst(start.count).dropLast(end.count))

        return start.map { .text($0.text) } +
            attempt(parsing: group) +
            end.map { .text($0.text) }
    }

    private static func attempt(parsing group: OptionalTokenGroup) -> AnnotatedString<Self> {
        let tokens = group.map { $0.annotation }
        do {
            let output = try parser.parse(tokens: tokens)
            let tokensTaken = tokens.count - output.remaining.count
            let text = group.dropLast(output.remaining.count).reduce("") { $0 + $1.text }

            if tokensTaken < tokens.count {
                let remaining = tokensTaken != tokens.count ? Array(group.dropFirst(tokensTaken)) : []
                return [.annotated(text, output.output)] + attempt(parsing: remaining)
            } else {
                return [.annotated(text, output.output)]
            }
        } catch {
            guard let head = group.first else { return [] }
            let remaining = Array(group.dropFirst())
            return [.text(head.text)] + attempt(parsing: remaining)
        }
    }

}
