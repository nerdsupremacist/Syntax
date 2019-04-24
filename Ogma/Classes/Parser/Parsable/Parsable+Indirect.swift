//
//  Parsable+Indirect.swift
//  Ogma
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parsable {
    
    public static var indirect: AnyParser<Token, Self> {
        return IndirectParsable<Self>().any()
    }
    
}

private struct IndirectParsable<P: Parsable>: Parser {
    typealias Token = P.Token
    typealias Output = P

    func parse(tokens: [P.Token]) throws -> ParserOutput<P.Token, P> {
        return try P.parser.parse(tokens: tokens)
    }
}
