//
//  UnicodeStringLiteralEscapingStrategy.swift
//  Ogma
//
//  Created by Mathias Quintero on 5/7/19.
//

import Foundation

public protocol UnicodeStringLiteralEscapingStrategy: StringLiteralEscapingStrategy {
    static var pattern: String { get }
    static var group: Int { get }
}

extension UnicodeStringLiteralEscapingStrategy {
    public static var group: Int {
        return 0
    }

    public static func escaped(string: String) throws -> String {
        let generator = UnicodeStringLiteralEscapeTokenGenerator(pattern: pattern, group: group)
        let result = try generator.take(text: string)

        guard let escaped = result.token else { fatalError("Resulting token cannot be nil") }

        return result.remainingString.map { escaped + $0 } ?? escaped
    }

    public static func escaped(character: Character) throws -> String {
        switch character {
        case "\\":
            return "\\"
        case "n":
            return "\n"
        case "0":
            return "\0"
        case "t":
            return "\t"
        case "r":
            return "\r"
        default:
            throw StringLiteralTokenGenerator.Error.invalidEscapedCharacter(character)
        }
    }
}

private struct UnicodeStringLiteralEscapeTokenGenerator: SingleGroupRegexTokenGenerator {
    typealias Token = String

    let pattern: String
    let group: Int

    func token(from matched: String) throws -> String? {
        guard let number = UInt32(matched, radix: 16) else {
            throw StringLiteralTokenGenerator.Error.invalidEscapedUnicodeLiteral(.notBase16Encoded(matched))
        }

        guard let unicodeScalar = UnicodeScalar(number) else {
            throw StringLiteralTokenGenerator.Error.invalidEscapedUnicodeLiteral(.notAUnicodeCharacter(matched, number))
        }

        return String(unicodeScalar: unicodeScalar)
    }
}

extension String {
    fileprivate init(unicodeScalar: UnicodeScalar) {
        var string = ""
        string.unicodeScalars.append(unicodeScalar)
        self = string
    }

    fileprivate init<S: Sequence>(unicodeScalars scalars: S) where S.Iterator.Element == UnicodeScalar {
        var string = ""
        string.unicodeScalars.append(contentsOf: scalars)
        self = string
    }
}
