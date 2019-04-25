//
//  StringLiteralTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

public struct StringLiteralTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = String

    let delimiter: String

    public var pattern: String {
        return "\(delimiter)(([^\(delimiter)]|\\.)*)\(delimiter)"
    }

    public let group: Int = 1

    public init(delimiter: String = "\"") {
        self.delimiter = delimiter
    }

    public func token(from matched: String) throws -> Token? {
        return matched
    }
}
