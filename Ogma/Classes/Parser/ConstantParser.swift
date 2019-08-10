//
//  ConstantParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/9/19.
//

import Foundation

struct ConstantParser<Token: TokenProtocol, Output>: SingleTokenParser {
    let value: Output

    var prefixes: Set<[Token]> {
        return [[]]
    }

    func parse(token: Token, stack: [AnyObject]) throws -> Output {
        return value
    }
}
