//
//  AnyTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenGenerator {

    public func any() -> AnyTokenGenerator<Token> {
        return AnyTokenGenerator(self)
    }

}

public class AnyTokenGenerator<Token: TokenProtocol>: TokenGenerator {
    let _take: (String) throws -> Generated<Token>

    init<G: TokenGenerator>(_ generator: G) where G.Token == Token {
        self._take = generator.take
    }

    public func take(text: String) throws -> Generated<Token> {
        return try _take(text)
    }
}
