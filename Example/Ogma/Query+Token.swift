//
//  Query+Token.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Ogma

extension Query {

    enum Token: TokenProtocol {
        case hashtag
        case equals
        case word(String)
        case string(String)
    }

}

extension Query.Token {

    static let and = Query.Token.word("and")

    var word: String? {
        guard case .word(let word) = self else { return nil }
        return word
    }

    var stringLiteral: String? {
        guard case .string(let string) = self else { return nil }
        return string
    }

}
