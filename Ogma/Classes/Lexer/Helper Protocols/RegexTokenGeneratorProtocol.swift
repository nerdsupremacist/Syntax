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
    var group: Int { get }
    func token(from matched: String) throws -> Token?
}

extension RegexTokenGeneratorProtocol {

    public var group: Int {
        return 0
    }

}

extension RegexTokenGeneratorProtocol {

    public func take(text: String) throws -> Result {
        let expression = try NSRegularExpression(pattern: "^\(pattern)")

        guard let match = expression.firstMatch(in: text, range: text.range),
            let matchRange = Range(match.range, in: text),
            matchRange.lowerBound == text.startIndex else {

            throw LexerError.noMatchFound(text, pattern: pattern)
        }

        let remaining = matchRange.upperBound < text.endIndex ? String(text[matchRange.upperBound...]) : nil

        return TokenResult(token: try token(in: match, for: text),
                           remainingString: remaining)
    }
    
}

extension RegexTokenGeneratorProtocol {

    func token(in match: NSTextCheckingResult, for text: String) throws -> Token? {
        let groupRange = match.range(at: group)

        guard let range = Range(groupRange, in: text) else {
            throw LexerError.noMatchFound(text, pattern: pattern)
        }

        let matched = String(text[range])

        do {
            return try token(from: matched)
        } catch let error as LexerError {
            throw error
        } catch {
            throw LexerError.cannotMap(matched, dueTo: error, generator: Self.self)
        }
    }

}
