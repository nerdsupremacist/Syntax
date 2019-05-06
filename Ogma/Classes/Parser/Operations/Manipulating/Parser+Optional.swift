//
//  OptionalParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

postfix operator .?

extension TokenProtocol {

    public func optional() -> AnyParser<Self, Void> {
        return parser.optional().map { _ in () }
    }

}

extension Parser {

    /// Make the value optional. If the value cannot be parsed it will return nil and not consume any tokens
    public func optional() -> AnyParser<Token, Output?> {
        return OptionalParser(source: self).any()
    }
    
}

private struct OptionalParser<Source: Parser>: Parser {
    typealias Token = Source.Token
    typealias Output = Source.Output?
    
    let source: Source

    func parse(tokens: [Source.Token], stack: [AnyObject]) throws -> ParserOutput<Source.Token, Source.Output?> {
        do {
            return try source.parse(tokens: tokens, stack: stack).map(Optional.some)
        } catch {
            return ParserOutput(output: nil, remaining: tokens)
        }
    }
}
