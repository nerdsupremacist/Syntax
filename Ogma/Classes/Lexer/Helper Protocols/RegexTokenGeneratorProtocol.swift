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

    public func take(text: String) throws -> Generated<Token> {
        let expression = try NSRegularExpression(pattern: "^\(pattern)")
        let match = expression.firstMatch(in: text, range: text.range)

        guard let groupRange = match?.range(at: group),
            groupRange.location != NSNotFound,
            let range = Range(groupRange, in: text),
            let matchRange = (match?.range).flatMap({ Range($0, in: text) }),
            matchRange.lowerBound == text.startIndex else {
            
            throw LexerError.noMatchFound(text, pattern: pattern)
        }
        
        let matched = String(text[range])
        let remaining = matchRange.upperBound < text.endIndex ? String(text[matchRange.upperBound...]) : nil

        do {
            return Generated(token: try token(from: matched), remainingString: remaining)
        } catch let error as LexerError {
            throw error
        } catch {
            throw LexerError.cannotMap(matched, dueTo: error, generator: Self.self)
        }
    }
    
}
