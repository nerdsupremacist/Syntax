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
        let generated = try generators.take(text: input)
        guard let remaining = generated.remainingString else { return [generated.token] }

        guard remaining.count != input.count else { throw LexerError.couldNotDecode(remaining.first) }

        let rest = try tokenize(input: remaining) as [Token?]
        return [generated.token] + rest
    }

}
