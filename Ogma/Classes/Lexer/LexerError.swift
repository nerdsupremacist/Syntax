//
//  LexerError.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/24/19.
//

import Foundation

enum LexerError: Error {
    case emptyTokenGenerator
    case couldNotDecode(Character?)
    case invalidLiteral(String, type: Any.Type)
    case noMatchFound(String, pattern: String)
    case cannotMap(String, dueTo: Error, generator: Any.Type)
    case noGeneratorMatched(String, errors: [LexerError])
    case custom(Error)
}
