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

        let annotations = try lexer
            .annotate(input)
            .grouppingAnnotations()

        return annotations
            .flatMap { element -> AnnotatedString<Self> in
                switch element {
                case .text(let text):
                    return [.text(text)]
                case .annotated(_, let tokenContext):
                    return attempt(toParse: tokenContext)
                }
            }
            .clean()
    }

}

extension Parsable {

    private static func attempt(toParse tokenContext: [AnnotationContext<Token?>]) -> AnnotatedString<Self> {

        if let first = tokenContext.first, first.value == nil {
            return [.text(first.text)] + attempt(toParse: Array(tokenContext.dropFirst()))
        }

        let tokenContext = tokenContext.compactMap { context -> AnnotationContext<Token>? in
            guard let value = context.value else { return nil }
            return AnnotationContext(text: context.text, value: value)
        }

        return attempt(toParse: tokenContext)
    }

    private static func attempt(toParse tokenContext: [AnnotationContext<Token>]) -> AnnotatedString<Self> {
        let tokens = tokenContext.map { $0.value }

        do {
            let output = try parser.parse(tokens: tokens)
            let tokensTaken = tokens.count - output.remaining.count
            let text = tokenContext.dropLast(output.remaining.count).reduce("") { $0 + $1.text }

            if tokensTaken < tokens.count {
                let remaining = tokensTaken != tokens.count ? Array(tokenContext.dropFirst(tokensTaken)) : []
                return [.annotated(text, output.output)] + attempt(toParse: remaining)
            } else {
                return [.annotated(text, output.output)]
            }
        } catch {
            guard let headContext = tokenContext.first else { return [] }
            let remaining = Array(tokenContext.dropFirst())
            return [.text(headContext.text)] + attempt(toParse: remaining)
        }
    }

}
