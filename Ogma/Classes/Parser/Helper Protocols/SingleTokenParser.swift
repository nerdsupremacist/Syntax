//
//  SingleTokenParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public protocol SingleTokenParser: Parser {
    func parse(token: Token) throws -> Output
}

extension SingleTokenParser {
    
    public func parse(tokens: [Token]) throws -> ParserOutput<Token, Output> {
        guard let token = tokens.first else { throw ParserError<Token>.noMoreTokens }
        let output = try parse(token: token)
        return ParserOutput(output: output, remaining: Array(tokens.dropFirst()))
    }
    
}
