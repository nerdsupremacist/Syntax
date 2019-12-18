//
//  TokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// A Token Generator will attempt to read a Token from the beginning of the string.
/// When succesfull it will return the Token and the remaining String
public protocol TokenGenerator {

    /// Tokens that are generated
    associatedtype Token: TokenProtocol

    /// Attempt to generate a Token from the beginning of the String
    func take(text: String) throws -> TokenResult<Token>

    /// Attempt to annotate the string with the Tokens from this string
    func annotate(text: String) throws -> AnnotatedString<Token?>
}

extension TokenGenerator {

    public func annotate(_ annotated: AnnotatedString<Token?>) throws -> AnnotatedString<Token?> {
        return try annotated.flatMap { element -> AnnotatedString<Token?> in
            guard case .text(let text) = element else { return [element] }
            return try annotate(text: text)
        }
    }

}
