//
//  OrParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public func ||<A: Parser, B: Parser>(lhs: A,
                                     rhs: B) -> AnyParser<A.Token, A.Output> where A.Output == B.Output, A.Token == B.Token {

    return OrParser(first: lhs, second: rhs).any()
}

private struct OrParser<A: Parser, B: Parser>: Parser where A.Output == B.Output, A.Token == B.Token {
    typealias Token = A.Token
    typealias Output = A.Output
    
    let first: A
    let second: B
    
    func parse(tokens: [Token]) throws -> ParserOutput<Token, Output> {
        do {
            return try first.parse(tokens: tokens)
        } catch {
            return try second.parse(tokens: tokens)
        }
    }
}
