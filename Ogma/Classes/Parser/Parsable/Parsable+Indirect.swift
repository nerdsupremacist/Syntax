//
//  Parsable+Indirect.swift
//  Ogma
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parsable {

    /// Indirect Parser for a Parsable Type. In order to avoid cycles during initialization
    public static var indirect: AnyParser<Token, Self> {
        return IndirectParsable<Self>().any()
    }
    
}

private class IndirectParsable<P: Parsable>: Parser {
    typealias Token = P.Token
    typealias Output = P

    private lazy var parser = P.parser

    var prefixes: Set<[P.Token]> {
        return parser.prefixes
    }

    func parse(tokens: [P.Token], stack: [AnyObject]) throws -> ParserOutput<P.Token, P> {
        return try parser.parse(tokens: tokens, stack: stack)
    }
}
