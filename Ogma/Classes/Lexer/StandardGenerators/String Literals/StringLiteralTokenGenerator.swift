//
//  StringLiteralTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

public struct StringLiteralTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = String

    let subGenerator: AnyTokenGenerator<String>
    let delimiter: String
    let allowsMultiline: Bool

    public var pattern: String {
        if allowsMultiline {
            return "\(delimiter)((\\\\.|[^\(delimiter)])*)\(delimiter)"
        } else {
            return "\(delimiter)((\\\\.|[^\(delimiter)\\n])*)\(delimiter)"
        }
    }

    public let group: Int = 1

    public init(delimiter: String = "\"",
                allowsMultiline: Bool = false,
                escapingStrategy: StringLiteralEscapingStrategy.Type = SwiftStringLiteralEscapingStrategy.self) {

        self.delimiter = delimiter
        self.allowsMultiline = allowsMultiline
        self.subGenerator = StringLiteralEscapedSectionTokenGenerator(delimiter: delimiter,
                                                                      strategy: escapingStrategy).any()
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
