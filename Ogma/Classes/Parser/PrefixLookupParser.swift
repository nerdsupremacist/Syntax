//
//  Dictionary+Parser.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/8/19.
//

import Foundation

public struct PrefixLookupParser<Token: Hashable, Output>: Parser {
    private let parsers: [Token : AnyParser<Token, Output>]

    public func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        guard let token = tokens.first else { throw ParserError<Token>.noMoreTokens }
        guard let parser = parsers[token] else { throw ParserError<Token>.tokenNotConvertibleTo(token, type: Output.self) }
        return try parser.parse(tokens: tokens, stack: stack)
    }
}

extension PrefixLookupParser: ExpressibleByDictionaryLiteral {

    public init(dictionaryLiteral elements: (Token, AnyParser<Token, Output>)...) {
        self.init(parsers: Dictionary(elements, uniquingKeysWith: { $1 }))
    }

}
