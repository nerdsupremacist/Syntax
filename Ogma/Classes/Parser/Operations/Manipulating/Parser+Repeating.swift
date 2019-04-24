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

private struct RepeatingParser<Source: Parser>: Parser {
    typealias Token = Source.Token
    typealias Output = [Source.Output]

    let source: Source
    
    func parse(tokens: [Token]) throws -> ParserOutput<Token, [Source.Output]> {
        let current: ParserOutput<Token, Source.Output>
        do {
            current = try source.parse(tokens: tokens)
        } catch {
            return ParserOutput(output: [], remaining: tokens)
        }
        
        let remaining = try parse(tokens: current.remaining)
        return remaining.map { [current.output] + $0 }
    }
}
