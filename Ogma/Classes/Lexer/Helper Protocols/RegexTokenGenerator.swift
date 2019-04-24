//
//  RegexTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// A TokenGenerator that matches the beginning of the String if it matches a Regular Expression
public protocol RegexTokenGenerator: TokenGenerator {
    var pattern: String { get }
    func token(from matched: String) throws -> Token?
}

extension RegexTokenGenerator {

    public func take(text: String) throws -> Generated<Token> {
        let expression = try NSRegularExpression(pattern: "^\(pattern)")
        let matchedRange = expression.rangeOfFirstMatch(in: text, range: text.range)
        
        guard matchedRange.location != NSNotFound,
            let range = Range(matchedRange, in: text),
            range.lowerBound == text.startIndex else {
            
            throw LexerError.noMatchFound(text, pattern: pattern)
        }
        
        let matched = String(text[range])
        let remaining = range.upperBound < text.endIndex ? String(text[range.upperBound...]) : nil

        do {
            return Generated(token: try token(from: matched), remainingString: remaining)
        } catch let error as LexerError {
            throw error
        } catch {
            throw LexerError.cannotMap(matched, dueTo: error, generator: Self.self)
        }
    }
    
}
