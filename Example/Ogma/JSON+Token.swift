//
//  Token.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension JSON {

    public enum Token: TokenProtocol, Hashable {
        case openCurlyBracket
        case closeCurlyBracket

        case openSquareBracket
        case closeSquareBracket

        case comma
        case colon

        case `true`
        case `false`

        case string(String)

        case double(Double)
        case int(Int)

        case null
    }

}

extension JSON.Token {

    var string: String? {
        guard case .string(let string) = self else { return nil }
        return string
    }

    var int: Int? {
        guard case .int(let int) = self else { return nil }
        return int
    }

    var double: Double? {
        guard case .double(let double) = self else { return nil }
        return double
    }

}
