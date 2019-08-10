//
//  RepeatingParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

postfix operator *
postfix operator +

/// Attempt to read the value of the parser as many times as possible
public postfix func * <P: Parser>(_ p: P) -> AnyParser<P.Token, [P.Output]> {
    return RepeatingParser(source: p).any()
}

/// Atempt to read the value of the parser at least once
public postfix func + <P: Parser>(_ p: P) -> AnyParser<P.Token, [P.Output]> {
    let parser = p && p*
    return parser.map { [$0] + $1 }
}

/// Attempt to read the value of the parser as many times as possible
public postfix func * <P: Parsable>(_ p: P.Type) -> AnyParser<P.Token, [P]> {
    return p.indirect*
}

/// Atempt to read the value of the parser at least once
public postfix func + <P: Parsable>(_ p: P.Type) -> AnyParser<P.Token, [P]> {
    return p.indirect+
}

private struct RepeatingParser<Source: Parser>: Parser {
    typealias Token = Source.Token
    typealias Output = [Source.Output]

    let source: Source

    func prefixes(stack: [AnyObject]) -> Set<[Source.Token]> {
        return source.prefixes(stack: stack)
    }

    func parse(tokens: [Source.Token], stack: [AnyObject]) throws -> ParserOutput<Source.Token, [Source.Output]> {
        let current: ParserOutput<Token, Source.Output>
        do {
            current = try source.parse(tokens: tokens, stack: stack)
        } catch {
            return ParserOutput(output: [], remaining: tokens)
        }

        let remaining = try parse(tokens: current.remaining, stack: [])
        return remaining.map { [current.output] + $0 }
    }
}
