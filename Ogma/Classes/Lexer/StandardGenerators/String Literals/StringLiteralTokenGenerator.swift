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

    public var pattern: String {
        return "\(delimiter)((\\\\.|[^\(delimiter)])*)\(delimiter)"
    }

    public let group: Int = 1

    public init(delimiter: String = "\"",
                escapingStrategy: StringLiteralEscapingStrategy.Type = SwiftStringLiteralEscapingStrategy.self) {

        self.delimiter = delimiter
        self.subGenerator = StringLiteralEscapedSectionTokenGenerator(delimiter: delimiter,
                                                                      strategy: escapingStrategy).any()
    }

    public func token(from matched: String) throws -> Token? {
        return try subGenerator.annotate(text: matched)
            .compactMap { $0 }
            .map { $0 }
    }
}
