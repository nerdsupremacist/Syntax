//
//  StringLiteralTokenGenerator+Error.swift
//  Ogma
//
//  Created by Mathias Quintero on 5/7/19.
//

import Foundation

extension StringLiteralTokenGenerator {

    public enum Error: Swift.Error {
        public enum InvalidEscapedUnicode {
            case notBase16Encoded(String)
            case notAUnicodeCharacter(String, UInt32)
        }

        case invalidEscapedUnicodeLiteral(InvalidEscapedUnicode)
        case invalidEscapedCharacter(Character)
        case lonelyBackslash
        case failedToDecodeEscapedSection(String, dueTo: [Swift.Error])
    }

}
