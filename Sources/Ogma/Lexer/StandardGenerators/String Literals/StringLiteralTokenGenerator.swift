//
//  StringLiteralTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

public struct StringLiteralTokenGenerator: SingleGroupRegexTokenGenerator {
    public typealias Token = String

    let subGenerator: AnyTokenGenerator<String>
    let start: String
    let end: String
    let allowsMultiline: Bool

    public var pattern: String {
        if allowsMultiline {
            return "\(start)((\\\\.|(?!\(end))(.|\\n))*)\(end)"
        } else {
            return "\(start)((\\\\.|(?!\(end)).)*)\(end)"
        }
    }

    public let group: Int = 1

    public init(start: Regex,
                end: Regex,
                allowsMultiline: Bool = false,
                escapingStrategy: StringLiteralEscapingStrategy.Type = SwiftStringLiteralEscapingStrategy.self) {

        self.start = start.pattern
        self.end = end.pattern
        self.allowsMultiline = allowsMultiline
        self.subGenerator = StringLiteralEscapedSectionTokenGenerator(delimiter: self.end,
                                                                      strategy: escapingStrategy).any()
    }

    public init(delimiter: Regex = "\"",
                allowsMultiline: Bool = false,
                escapingStrategy: StringLiteralEscapingStrategy.Type = SwiftStringLiteralEscapingStrategy.self) {

        self.init(start: delimiter, end: delimiter, allowsMultiline: allowsMultiline, escapingStrategy: escapingStrategy)
    }

    public func token(from matched: String) throws -> Token? {
        let string = try subGenerator.annotate(text: matched)
            .compactMap { $0 }
            .map { $0 }

        if allowsMultiline {
            let withoutExtraSpacing = string
                .replacingOccurrences(of: "\\n[ \\t]+", with: "\n", options: .regularExpression)
                .replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
                .replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)

            return withoutExtraSpacing
        } else {
            return string
        }
    }
}
