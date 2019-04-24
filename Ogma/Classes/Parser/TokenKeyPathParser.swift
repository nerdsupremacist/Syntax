//
//  TokenKeyPathParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenProtocol {

    public static func parser<Value>(for keyPath: KeyPath<Self, Value?>) -> AnyParser<Self, Value> {
        return TokenKeyPathParser(keyPath: keyPath).any()
    }

}

private struct TokenKeyPathParser<Token: TokenProtocol, Output>: SingleTokenParser {
    let keyPath: KeyPath<Token, Output?>

    func parse(token: Token) throws -> Output {
        guard let value = token[keyPath: keyPath] else {
            throw ParserError.tokenNotConvertibleTo(token, type: Output.self)
        }
        return value
    }
}
