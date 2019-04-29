//
//  Parser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// A Parser consumes Tokens to return an Output
public protocol Parser {

    /// Tokens that it should consume
    associatedtype Token: TokenProtocol

    /// Output of the Parser
    associatedtype Output

    /// Parse the Tokens. And Return the output with the remaining Tokens
    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output>
}

extension Parser {

    public func parse(tokens: [Token]) throws -> ParserOutput<Token, Output> {
        return try parse(tokens: tokens, stack: [])
    }

}
