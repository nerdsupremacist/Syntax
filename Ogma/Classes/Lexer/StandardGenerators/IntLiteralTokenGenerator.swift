//
//  IntTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

public struct IntLiteralTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = Int

    public let pattern: String = "-?\\d+(e\\d+)?\\b"
    let numberFormatter = NumberFormatter()

    public init() { }

    public func token(from matched: String) throws -> Token? {
        guard let value = numberFormatter.number(from: matched)?.intValue else {
            throw LexerError.invalidLiteral(matched, type: Int.self)
        }

        return value
    }
}
