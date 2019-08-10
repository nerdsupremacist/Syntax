//
//  ParserError.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

/// Error thrown from a Parser
public enum ParserError<Token: TokenProtocol>: Error {
    /// Expected a Token but none are left
    case noMoreTokens
    /// Expected a specific Token but received another one
    case unexpectedToken(Token, expected: Token)
    /// Expected a specific Token but received another one
    case lookaheadFailedToReturnSubParser(basedOn: [Token])
    /// Attempted to Parse a value but did not consume all tokens provided
    case parsableValueDidNotConsumeAllTokens(Any.Type, remaining: [Token])
    /// The token cannot be converted to the Desired Type
    case tokenNotConvertibleTo(Token, type: Any.Type)
    /// Parser is calling itself recursively
    case recursiveCall(to: Any)
    /// Parsing a binary operation still resulted in a single member being parsed
    case expectedABinaryOperation
    /// Backtracking failed to gather any values
    case backtrackingFailed(parsers: [Any], tokens: [Token])
}
