//
//  MultiLineCommentTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/25/19.
//

import Foundation

public struct MultiLineComment: TokenProtocol {
    public let text: String
}

public struct MultiLineCommentTokenGenerator: SingleGroupRegexTokenGenerator {
    public typealias Token = MultiLineComment

    let prefixPattern: String
    let postfixPattern: String

    public var pattern: String {
        return "\(prefixPattern)\\s*((?:(?!\(postfixPattern))(.|\\n))*)\(postfixPattern)"
    }

    public let group: Int = 1

    public init(prefix: Regex, postfix: Regex) {
        self.prefixPattern = prefix.pattern
        self.postfixPattern = postfix.pattern
    }

    public func token(from matched: String) throws -> MultiLineComment? {
        let withoutExtraSpacing = matched
            .replacingOccurrences(of: "\\n[ \\t]+", with: "\n", options: .regularExpression)
            .replacingOccurrences(of: "\\s$", with: "", options: .regularExpression)

        return MultiLineComment(text: withoutExtraSpacing)
    }
}
