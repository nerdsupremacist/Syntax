//
//  TokenGenerator+map.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenGenerator {

    /// Map a Token Generator to create Tokens of another Type
    public func map<T: TokenProtocol>(_ transform: @escaping (Token) throws -> T?) -> AnyTokenGenerator<T> {
        return MappedTokenGenerator(source: self, transform: transform).any()
    }

    public func ignore<T: TokenProtocol>() -> AnyTokenGenerator<T> {
        return map { _ in nil }
    }
    
}

private struct MappedTokenGenerator<Token: TokenProtocol, Source: TokenGenerator>: TokenGenerator {
    let source: Source
    let transform: (Source.Token) throws -> Token?

    func take(text: String) throws -> TokenResult<Token> {
        return try source.take(text: text).map(transform)
    }

    func annotate(text: String) throws -> [AnnotationElement<Token?>] {
        return try source.annotate(text: text).map { try $0.flatMap(transform) }
    }
}
