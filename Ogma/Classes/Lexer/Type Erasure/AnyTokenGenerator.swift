//
//  AnyTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenGenerator {

    /// Cast a TokenGenerator to Any
    public func any() -> AnyTokenGenerator<Token> {
        return AnyTokenGenerator(self)
    }

}

/// Wrapper around another TokenGenerator for Type Erasure
public class AnyTokenGenerator<Token: TokenProtocol>: TokenGenerator {
    let _take: (String) throws -> TokenResult<Token>
    let _annotate: (String) throws -> AnnotatedString<Token?>

    init<G: TokenGenerator>(_ generator: G) where G.Token == Token {
        self._take = generator.take
        self._annotate = generator.annotate(text:)
    }

    public func take(text: String) throws -> Result {
        return try _take(text)
    }

    public func annotate(text: String) throws -> [AnnotationElement<Token?>] {
        return try _annotate(text)
    }
}
