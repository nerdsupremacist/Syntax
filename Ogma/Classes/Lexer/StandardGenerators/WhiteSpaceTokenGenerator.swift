//
//  WhiteSpaceTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

public struct WhiteSpace: TokenProtocol { }

public struct WhiteSpaceTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = WhiteSpace

    public let pattern: String = "\\s+"

    public init() { }

    public func token(from matched: String) throws -> Token? {
        return WhiteSpace()
    }
}
