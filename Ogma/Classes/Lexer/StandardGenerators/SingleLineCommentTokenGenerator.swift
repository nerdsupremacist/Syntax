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

public struct SingleLineCommentTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = SingleLineComment

    let prefixPattern: String

    public var pattern: String {
        return "\(prefixPattern)\\s*([^\\n]*)"
    }

    public let group: Int = 1

    public init(prefixPattern: String) {
        self.prefixPattern = prefixPattern
    }

    public func token(from matched: String) throws -> SingleLineComment? {
        return SingleLineComment(text: matched)
    }
}
