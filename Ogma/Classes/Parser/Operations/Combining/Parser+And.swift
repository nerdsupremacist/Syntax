//
//  AndParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// Combine two Parsers sequentially
public func && <A: Parser, B: Parser>(lhs: A,
                                      rhs: B) -> AnyParser<A.Token, (A.Output, B.Output)> where A.Token == B.Token {

    return AndParser(first: lhs, second: rhs).any()
}

/// Combine two Parsers sequentially
public func && <A: Parser, B: Parser>(lhs: A,
                                      rhs: B) -> AnyParser<A.Token, A.Output> where B.Output == Void, A.Token == B.Token {

    return (lhs && rhs).map { result, _ in result }
}

/// Combine two Parsers sequentially
public func && <A: Parser, B: Parser>(lhs: A,
                                      rhs: B) -> AnyParser<A.Token, B.Output> where A.Output == Void, A.Token == B.Token {

    return (lhs && rhs).map { _, result in result }
}

/// Combine two Parsers sequentially
public func && <A: Parsable, B: Parsable>(lhs: A.Type,
                                          rhs: B.Type) -> AnyParser<A.Token, (A, B)> where A.Token == B.Token {

    return lhs.indirect && rhs.indirect
}

/// Combine two Parsers sequentially
public func && <A: Parsable, B: Parser>(lhs: A.Type,
                                        rhs: B) -> AnyParser<A.Token, (A, B.Output)>  where A.Token == B.Token {

    return lhs.indirect && rhs
}

/// Combine two Parsers sequentially
public func && <A: Parser, B: Parsable>(lhs: A,
                                        rhs: B.Type) -> AnyParser<A.Token, (A.Output, B)> where A.Token == B.Token {

    return lhs && rhs.indirect
}

/// Combine two Parsers sequentially
public func &&<A: Parser, Token>(lhs: Token, rhs: A) -> AnyParser<A.Token, A.Output> where A.Token == Token {
    return lhs.parser && rhs
}

/// Combine two Parsers sequentially
public func && <A: Parser, Token>(lhs: A, rhs: Token) -> AnyParser<A.Token, A.Output> where A.Token == Token {
    return lhs && rhs.parser
}

/// Combine two Parsers sequentially
public func && <A: Parsable, Token>(lhs: Token, rhs: A.Type) -> AnyParser<A.Token, A> where A.Token == Token {
    return lhs.parser && rhs.indirect
}

/// Combine two Parsers sequentially
public func && <A: Parsable, Token>(lhs: A.Type, rhs: Token) -> AnyParser<A.Token, A> where A.Token == Token {
    return lhs.indirect && rhs.parser
}

private class AndParser<A: Parser, B: Parser>: Parser where A.Token == B.Token {
    typealias Token = A.Token
    typealias Output = (A.Output, B.Output)
    
    let first: A
    let second: B

    init(first: A, second: B) {
        self.first = first
        self.second = second
    }

    func parse(tokens: [A.Token], stack: [AnyObject]) throws -> ParserOutput<A.Token, (A.Output, B.Output)> {

        guard !stack.contains(where: { $0 === self }) else {
            throw ParserError<Token>.recursiveCall(to: self)
        }

        let firstOutput = try first.parse(tokens: tokens, stack: stack + [self])
        return try second.parse(tokens: firstOutput.remaining, stack: []).map { (firstOutput.output, $0) }
    }
}
