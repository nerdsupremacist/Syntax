//
//  RegexTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// A TokenGenerator that matches the beginning of the String if it matches a Regular Expression
public protocol RegexTokenGeneratorProtocol: TokenGenerator {
    var pattern: String { get }
    func token(from groups: MatchGroups) throws -> Token?
}

extension RegexTokenGeneratorProtocol {

    public func take(text: String) throws -> TokenResult<Token> {
        let expression: NSRegularExpression
        do {
            expression = try NSRegularExpression(pattern: "^\(pattern)")
        } catch {
            print(pattern)
            print(error)
            throw error
        }

        guard let match = expression.firstMatch(in: text, range: text.range),
            let matchRange = Range(match.range, in: text),
            matchRange.lowerBound == text.startIndex else {

            throw LexerError.noMatchFound(text, pattern: pattern)
        }

        let remaining = matchRange.upperBound < text.endIndex ? String(text[matchRange.upperBound...]) : nil

        return TokenResult(token: try token(in: match, for: text, expression: expression),
                           remainingString: remaining)
    }
    
}

extension RegexTokenGeneratorProtocol {

    func token(in match: NSTextCheckingResult, for text: String, expression: NSRegularExpression) throws -> Token? {
        let matchGroups = MatchGroups(regularExpression: expression, match: match, text: text, pattern: pattern)

        do {
            return try token(from: matchGroups)
        } catch let error as LexerError {
            throw error
        } catch {
            throw LexerError.cannotMap(matchGroups, dueTo: error, generator: Self.self)
        }
    }

}
