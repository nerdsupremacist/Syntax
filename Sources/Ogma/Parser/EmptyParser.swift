//
//  EmptyParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/13/19.
//

import Foundation

extension AnyParser {

    public static func empty(with value: Output) -> AnyParser<Token, Output> {
        return EmptyParser(value: value).any()
    }

}

extension AnyParser where Output == Void {

    public static var empty: AnyParser<Token, Void> {
        return .empty(with: ())
    }

}

private struct EmptyParser<Token: TokenProtocol, Output>: Parser {
    let value: Output

    func prefixes(stack: [AnyObject]) -> Set<Prefix<Token>> {
        return []
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        return ParserOutput(output: value,
                            remaining: tokens)
    }
}
