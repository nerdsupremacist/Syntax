//
//  GeneratorLexer.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

public protocol GeneratorLexer: LexerProtocol {
    static var generator: AnyTokenGenerator<Token> { get }
}

extension GeneratorLexer {

    public static func tokenize(input: String) throws -> [Token] {
        return try tokenize(input: input).compactMap { $0 }
    }

    private static func tokenize(input: String) throws -> [Token?] {
        let generated = try generator.take(text: input)
        guard let remaining = generated.remainingString else { return [generated.token] }

        guard remaining.count != input.count else { throw LexerError.couldNotDecode(remaining.first) }

        let rest = try tokenize(input: remaining) as [Token?]
        return [generated.token] + rest
    }

}
