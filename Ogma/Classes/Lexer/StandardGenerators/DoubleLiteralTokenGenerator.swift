//
//  DoubleLiteralTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

public struct DoubleLiteralTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = Double

    public let pattern: String = "-?\\d+(,\\d+)*\\.\\d+(e\\d+)?\\b"
    let numberFormatter = NumberFormatter()

    public init() { }

    public func token(from matched: String) throws -> Token? {
        guard let value = numberFormatter.number(from: matched)?.doubleValue else {
            throw LexerError.invalidLiteral(matched, type: Double.self)
        }
        return value
    }
}
