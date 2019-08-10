//
//  AnyParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// Wrapper around another Parser for Type Erasure
public struct AnyParser<Token: TokenProtocol, Output>: Parser {
    let _parse: ([Token], [AnyObject]) throws -> ParserOutput<Token, Output>
    let _prefixes: ([AnyObject]) -> Set<[Token]>
    let _source: Any

    init<P: Parser>(_ parser: P) where P.Token == Token, P.Output == Output {
        self._parse = parser.parse
        self._prefixes = parser.prefixes
        self._source = parser
    }

    public func prefixes(stack: [AnyObject]) -> Set<[Token]> {
        return _prefixes(stack)
    }

    public func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        return try _parse(tokens, stack)
    }
}

extension AnyParser {

    public static func with(value: Output) -> AnyParser<Token, Output> {
        return AnyParser(ConstantParser(value: value))
    }

}
