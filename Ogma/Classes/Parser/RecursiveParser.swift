//
//  RecursiveParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/13/19.
//

import Foundation

extension AnyParser {

    public static func recursive<P: Parser>(_ closure: (AnyParser<Token, Output>) -> P) -> AnyParser<Token, Output> where P.Token == Token, P.Output == Output {
        return RecursiveParser(closure).any()
    }

}

private struct UnownedRecursiveParser<Token: TokenProtocol, Output>: Parser {
    unowned let parser: RecursiveParser<Token, Output>

    func prefixes(stack: [AnyObject]) -> Set<Prefix<Token>> {
        return parser.prefixes(stack: stack)
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        return try parser.parse(tokens: tokens, stack: stack)
    }
}

private class RecursiveParser<Token: TokenProtocol, Output>: Parser {
    private var parser: AnyParser<Token, Output>!

    init<P: Parser>(_ closure: (AnyParser<Token, Output>) -> P) where P.Token == Token, P.Output == Output {
        let unownedParser = UnownedRecursiveParser(parser: self)
        parser = closure(unownedParser.any()).any()
    }
    
    func prefixes(stack: [AnyObject]) -> Set<Prefix<Token>> {
        return parser.prefixes(stack: stack)
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        return try parser.parse(tokens: tokens, stack: stack)
    }
}
