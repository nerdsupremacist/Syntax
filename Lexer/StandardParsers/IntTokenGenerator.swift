//
//  IntTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension Int {

    public static let generator: AnyTokenGenerator<Int> = IntTokenGenerator().any()

}

private struct InvalidNumberLiteralError: Error {
    let text: String
}

private struct IntTokenGenerator: RegexTokenGenerator {
    typealias Token = Int

    var pattern: String {
        return "[0-9]+\\b"
    }

    func token(from matched: String) throws -> Token? {
        guard let value = Int(matched) else { throw InvalidNumberLiteralError(text: matched) }
        return value
    }
}
