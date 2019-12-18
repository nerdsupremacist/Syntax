//
//  SingleTokenParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// Parser that consumes one Token at a Time
public protocol SingleTokenParser: Parser {
    /// Attempt to read output from a single Token
    func parse(token: Token, stack: [AnyObject]) throws -> Output
}

extension SingleTokenParser {
    
    public func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        guard let token = tokens.first else { throw ParserError<Token>.noMoreTokens }
        let output = try parse(token: token, stack: stack)
        return ParserOutput(output: output, remaining: Array(tokens.dropFirst()))
    }
    
}
