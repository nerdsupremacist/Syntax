//
//  DoubleTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension Double {

    public static let generator: AnyTokenGenerator<Double> = DoubleTokenGenerator().any()

}

private struct InvalidNumberLiteralError: Error {
    let text: String
}

private struct DoubleTokenGenerator: RegexTokenGenerator {
    typealias Token = Double

    var pattern: String {
        return "[0-9\\.]+\\b"
    }

    func token(from matched: String) throws -> Token? {
        guard let value = Double(matched) else { throw InvalidNumberLiteralError(text: matched) }
        return value
    }
}
