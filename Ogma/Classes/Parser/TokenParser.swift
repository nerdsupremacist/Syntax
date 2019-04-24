//
//  SpecificTokenParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension TokenProtocol {

    public var parser: AnyParser<Self, Void> {
        return TokenParser(token: self).any()
    }

}

struct UnexpectedToken<Token: TokenProtocol>: Error {
    let token: Token
    let expected: Token
}

private struct TokenParser<Token: TokenProtocol>: SingleTokenParser {
    typealias Output = Void
    let token: Token
    
    func parse(token: Token) throws -> Void {
        guard token == self.token else { throw UnexpectedToken(token: token, expected: self.token) }
    }
}
