//
//  ParserError.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

enum ParserError<Token: TokenProtocol>: Error {
    case noMoreTokens
    case unexpectedToken(Token, expected: Token)
    case parsableValueDidNotConsumeAllTokens(Any.Type, remaining: [Token])
    case tokenNotConvertibleTo(Token, type: Any.Type)
}
