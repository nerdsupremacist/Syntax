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
    func take(text: String) throws -> Generated<Token>
}
