//
//  StringLiteralEscapedSectionTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 5/7/19.
//

import Foundation

struct StringLiteralEscapedSectionTokenGenerator: SingleGroupRegexTokenGenerator {
    typealias Token = String

    let pattern: String = "\\\\(([^\\\\ \\s]+|\\\\)?)"
    let group: Int = 1
    
    let delimiter: String
    let strategy: StringLiteralEscapingStrategy.Type

    func token(from matched: String) throws -> String? {

        if matched.hasPrefix(delimiter) {
            return matched
        }

        let stringError: Error
        do {
            return try strategy.escaped(string: matched)
        } catch {
            stringError = error
        }

        guard let character = matched.first else { throw StringLiteralTokenGenerator.Error.lonelyBackslash }

        do {
            return try strategy.escaped(character: character) + String(matched.dropFirst())
        } catch let characterError {
            throw StringLiteralTokenGenerator.Error.failedToDecodeEscapedSection(matched,
                                                                                 dueTo: [
                                                                                    stringError,
                                                                                    characterError,
                                                                                    ])
        }
    }
}
