//
//  MatchGroups.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/11/19.
//

import Foundation

public struct MatchGroups {
    public let text: String
    private let results: [String]
}

extension MatchGroups {

    init(regularExpression: NSRegularExpression,
         match: NSTextCheckingResult,
         text: String,
         pattern: String) throws {

        self.text = text

        let groups = 0...regularExpression.numberOfCaptureGroups
        self.results = try groups.map { group in
            let groupRange = match.range(at: group)

            guard let range = Range(groupRange, in: text) else {
                throw LexerError.noMatchFound(text, pattern: pattern)
            }

            return String(text[range])
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

    public subscript(index: Int) -> String {
        return results[index]
    }

    public func index(after i: Int) -> Int {
        return results.index(after: i)
    }
}
