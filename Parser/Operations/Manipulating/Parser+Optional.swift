//
//  OptionalParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

postfix operator .?

public postfix func .?<P: Parser>(_ p: P) -> AnyParser<P.Token, P.Output?> {
    return p.optional()
}

extension Parser {
    
    public func optional() -> AnyParser<Token, Output?> {
        return OptionalParser(source: self).any()
    }
    
}

private struct OptionalParser<Source: Parser>: Parser {
    typealias Token = Source.Token
    typealias Output = Source.Output?
    
    let source: Source
    
    func parse(tokens: [Token]) throws -> ParserOutput<Token, Output> {
        do {
            return try source.parse(tokens: tokens).map(Optional.some)
        } catch {
            return ParserOutput(output: nil, remaining: tokens)
        }
    }
}
