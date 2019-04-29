//
//  OrParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// Create a Parser that return the first succesfull result from two Parsers
public func ||<A: Parser, B: Parser>(lhs: A,
                                     rhs: B) -> AnyParser<A.Token, A.Output> where A.Output == B.Output, A.Token == B.Token {

    return OrParser(first: lhs, second: rhs).any()
}

private struct OrParser<A: Parser, B: Parser>: Parser where A.Output == B.Output, A.Token == B.Token {
    typealias Token = A.Token
    typealias Output = A.Output
    
    let first: A
    let second: B

    func parse(tokens: [A.Token], stack: [AnyObject]) throws -> ParserOutput<A.Token, A.Output> {
        do {
            return try first.parse(tokens: tokens, stack: stack)
        } catch {
            return try second.parse(tokens: tokens, stack: stack)
        }
    }
}
