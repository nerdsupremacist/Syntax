//
//  SingleGroupRegexTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/11/19.
//

import Foundation

public protocol SingleGroupRegexTokenGenerator: RegexTokenGeneratorProtocol {
    var group: Int { get }
    func token(from matched: String) throws -> Token?
}

extension SingleGroupRegexTokenGenerator {

    public var group: Int {
        return 0
    }

}

extension SingleGroupRegexTokenGenerator {

    public func token(from groups: MatchGroups) throws -> Token? {
        guard (groups.startIndex..<groups.endIndex).contains(group) else {
            throw LexerError.noMatchFound(groups.text, pattern: pattern)
        }
        return try token(from: try groups.attempt(group: group))
    }

}
