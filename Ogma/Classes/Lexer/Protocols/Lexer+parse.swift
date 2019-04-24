//
//  Lexer+parse.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

extension LexerProtocol {

    /// Parse a Parsable value from a String
    public static func parse<P: Parsable>(input: String, of type: P.Type = P.self) throws -> P where P.Token == Token {
        let tokens = try tokenize(input: input)
        return try type.init(tokens: tokens)
    }

}
