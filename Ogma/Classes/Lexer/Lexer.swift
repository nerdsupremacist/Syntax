//
//  Lexer.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct LexerCouldNotDecode: Error {
    let character: Character?
}

public protocol LexerProtocol {
    associatedtype Token: TokenProtocol
    static func tokenize(input: String) throws -> [Token]
}

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
        guard remaining.count != input.count else { throw LexerCouldNotDecode(character: remaining.first) }
        let rest = try tokenize(input: remaining) as [Token?]
        return [generated.token] + rest
    }
    
}
