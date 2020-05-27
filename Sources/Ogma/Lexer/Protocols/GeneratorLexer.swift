//
//  GeneratorLexer.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

/// A GeneratorLexer is a Lexer that delegates its job to a TokenGenerator by running it multiple times
public protocol GeneratorLexer: LexerProtocol {
    typealias Generators = [AnyTokenGenerator<Token>]
    /// Generator that should be called to generate Tokens
    static var generators: Generators { get }
}

extension GeneratorLexer {

    /// Turns an String into a sequence of Tokens
    public static func tokenize(_ input: String) throws -> [Token] {
        return try tokenize(input: input).compactMap { $0 }
    }

    private static func tokenize(input: String) throws -> [Token?] {
        var remaining: String? = input
        var tokens = [Token?]()

        while let remainingInput = remaining {
            let generated = try generators.take(text: remainingInput)
            remaining = generated.remainingString
            tokens.append(generated.token)
            if let remaining = remaining, remaining.count == remainingInput.count {
                throw LexerError.couldNotDecode(remaining.first)
            }
        }

        return tokens
    }

}

extension GeneratorLexer {

    public static func annotate(_ input: String) throws -> AnnotatedString<Token?> {
        return try generators.annotate(text: input)
    }

}
