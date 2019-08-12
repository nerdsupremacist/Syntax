//
//  LexerError.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

/// Error that can be returned by a lexer
enum LexerError: Error {
    /// Character could not be matched to a specific Token
    case couldNotDecode(Character?)
    /// Literal is not valid for the specific type.
    /// Should only occur if the regular expression is flawed
    case invalidLiteral(String, type: Any.Type)
    /// The Regular Expression did not yield a match at the beginning of the string
    case noMatchFound(String, pattern: String)
    /// An error occurred while mapping the output matched to the Regular Expression
    case cannotMap(MatchGroups, dueTo: Error, generator: Any.Type)
    /// No TokenGenerator managed to create a token from the String
    case noGeneratorMatched(String, errors: [LexerError])
    /// A custom error from outside the framework was thrown
    case custom(Error)
}
