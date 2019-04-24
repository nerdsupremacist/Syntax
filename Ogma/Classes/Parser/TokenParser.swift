//
//  SpecificTokenParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension TokenProtocol {

    /// Parser that will consume the current Token
    public var parser: AnyParser<Self, Void> {
        return TokenParser(token: self).any()
    }

}

private struct TokenParser<Token: TokenProtocol>: SingleTokenParser {
    typealias Output = Void
    let token: Token
    
    func parse(token: Token) throws -> Void {
        guard token == self.token else { throw ParserError.unexpectedToken(token, expected: self.token) }
    }
}
