//
//  MatchGroups.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/11/19.
//

import Foundation

public struct MatchGroups {
    public let text: String
    public let pattern: String
    private let results: [String?]
}

extension MatchGroups {

    init(regularExpression: NSRegularExpression,
         match: NSTextCheckingResult,
         text: String,
         pattern: String) {

        self.text = text
        self.pattern = pattern

        let groups = 0...regularExpression.numberOfCaptureGroups
        self.results = groups.map { group in
            let groupRange = match.range(at: group)
            return Range(groupRange, in: text).map { String(text[$0]) }
        }
    }

}

extension MatchGroups: Collection {
    public var startIndex: Int {
        return results.startIndex
    }

    public var endIndex: Int {
        return results.endIndex
    }

    public subscript(index: Int) -> String? {
        return results[index]
    }

    public func index(after i: Int) -> Int {
        return results.index(after: i)
    }
}

extension MatchGroups {

    public func attempt(group: Int) throws -> String {
        guard let value = self[group] else {
            throw LexerError.noMatchFound(text, pattern: pattern)
        }
        return value
    }

}
