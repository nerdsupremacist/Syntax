//
//  TokenGenerator+map.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenGenerator {

    public func map<T: TokenProtocol>(_ transform: @escaping (Token) throws -> T) -> AnyTokenGenerator<T> {
        return MappedTokenGenerator(source: self, transform: transform).any()
    }

}

private struct MappedTokenGenerator<Token: TokenProtocol, Source: TokenGenerator>: TokenGenerator {
    let source: Source
    let transform: (Source.Token) throws -> Token

    func take(text: String) throws -> Generated<Token> {
        return try source.take(text: text).map(transform)
    }
}
