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

    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parser, B: Parser>(lhs: A,
                                      rhs: B) -> AnyParser<A.Token, A.Output> where B.Output == Void, A.Token == B.Token {

    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parser, B: Parser>(lhs: A,
                                      rhs: B) -> AnyParser<A.Token, B.Output> where A.Output == Void, A.Token == B.Token {

    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parsable, B: Parsable>(lhs: A.Type,
                                          rhs: B.Type) -> AnyParser<A.Token, (A, B)> where A.Token == B.Token {

    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parsable, B: Parser>(lhs: A.Type,
                                        rhs: B) -> AnyParser<A.Token, (A, B.Output)>  where A.Token == B.Token {

    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parser, B: Parsable>(lhs: A,
                                        rhs: B.Type) -> AnyParser<A.Token, (A.Output, B)> where A.Token == B.Token {

    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func &&<A: Parser, Token>(lhs: Token, rhs: A) -> AnyParser<A.Token, A.Output> where A.Token == Token {
    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parser, Token>(lhs: A, rhs: Token) -> AnyParser<A.Token, A.Output> where A.Token == Token {
    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parsable, Token>(lhs: Token, rhs: A.Type) -> AnyParser<A.Token, A> where A.Token == Token {
    return lhs.and(rhs)
}

/// Combine two Parsers sequentially
public func && <A: Parsable, Token>(lhs: A.Type, rhs: Token) -> AnyParser<A.Token, A> where A.Token == Token {
    return lhs.and(rhs)
}

extension Parser {

    public func and<P: Parser>(_ parser: P) -> AnyParser<Token, (Output, P.Output)> where Token == P.Token {
        return AndParser(first: self, second: parser).excludingRecursion()
    }

    public func and<P: Parser>(_ parser: P) -> AnyParser<Token, Output> where Token == P.Token, P.Output == Void {
        return and(parser).map { $0.0 }
    }

    public func and(_ token: Token) -> AnyParser<Token, Output> {
        return and(token.parser)
    }

    public func and<P: Parsable>(_ parsable: P.Type) -> AnyParser<Token, (Output, P)> where Token == P.Token {
        return and(parsable.indirect)
    }

}

extension Parser where Output == Void {

    public func and<P: Parser>(_ parser: P) -> AnyParser<Token, P.Output> where Token == P.Token {
        return and(parser).map { $1 }
    }

}

extension Parsable {

    public static func and<P: Ogma.Parser>(_ parser: P) -> AnyParser<Token, (Self, P.Output)> where Token == P.Token {
        return indirect.and(parser)
    }

    public static func and<P: Ogma.Parser>(_ parser: P) -> AnyParser<Token, Self> where Token == P.Token, P.Output == Void {
        return and(parser).map { $0.0 }
    }

    public static func and(_ token: Token) -> AnyParser<Token, Self> {
        return and(token.parser)
    }

    public static func and<P: Parsable>(_ parsable: P.Type) -> AnyParser<Token, (Self, P)> where Token == P.Token {
        return and(parsable.indirect)
    }

}

extension TokenProtocol {

    public func and<P: Parser>(_ parser: P) -> AnyParser<Self, P.Output> where Self == P.Token {
        return self.parser.and(parser)
    }

    public func and(_ token: Self) -> AnyParser<Self, Void> {
        return and(token.parser)
    }

    public func and<P: Parsable>(_ parsable: P.Type) -> AnyParser<Self, P> where Self == P.Token {
        return and(parsable.indirect)
    }

}

private struct AndParser<A: Parser, B: Parser>: Parser where A.Token == B.Token {
    typealias Token = A.Token
    typealias Output = (A.Output, B.Output)
    
    let first: A
    let second: B

    func prefixes(stack: [AnyObject]) -> Set<Prefix<A.Token>> {
        let first = self.first.prefixes(stack: stack)

        if first.contains([]) {
            return first.subtracting([[]]).union(second.prefixes(stack: stack))
        }

        return first
    }

    func parse(tokens: [A.Token], stack: [AnyObject]) throws -> ParserOutput<A.Token, (A.Output, B.Output)> {
        let firstOutput = try first.parse(tokens: tokens, stack: stack)
        return try second.parse(tokens: firstOutput.remaining, stack: []).map { (firstOutput.output, $0) }
    }
}
