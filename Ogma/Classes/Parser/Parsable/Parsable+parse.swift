//
//  Parsable+parse.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

extension Parsable {

    /// Parse a Parsable value from a String
    public static func parse<L: LexerProtocol>(input: String,
                                               using lexer: L.Type) throws -> Self where L.Token == Token {

        let tokens = try lexer.tokenize(input: input)
        return try Self(tokens: tokens)
    }

}
