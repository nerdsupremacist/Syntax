//
//  SingleLineCommentTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/25/19.
//

import Foundation

public struct SingleLineComment: TokenProtocol {
    public let text: String
}

public struct SingleLineCommentTokenGenerator: SingleGroupRegexTokenGenerator {
    public typealias Token = SingleLineComment

    let prefixPattern: String

    public var pattern: String {
        return "\(prefixPattern)[ \\t]*(.*)[ \\t]*"
    }

    public let group: Int = 1

    public init(prefixPattern: String) {
        self.prefixPattern = prefixPattern
    }

    public func token(from matched: String) throws -> SingleLineComment? {
        return SingleLineComment(text: matched)
    }
}
