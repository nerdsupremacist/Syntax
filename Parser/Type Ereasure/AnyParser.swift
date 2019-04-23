//
//  AnyParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public struct AnyParser<Token: TokenProtocol, Output>: Parser {
    
    let _parse: ([Token]) throws -> ParserOutput<Token, Output>
    
    init<P: Parser>(_ parser: P) where P.Token == Token, P.Output == Output {
        self._parse = parser.parse
    }
    
    public func parse(tokens: [Token]) throws -> ParserOutput<Token, Output> {
        return try _parse(tokens)
    }
}
