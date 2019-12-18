//
//  Parser+parse+optionals.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/29/19.
//

import Foundation


extension Parser {

    func parse(tokens: [Token?]) throws -> ParserOutput<Token?, Output> {
        let parsable = tokens.compactMap { $0 }
        let parsed = try parse(tokens: parsable, stack: [])
        return ParserOutput(output: parsed.output,
                            remaining: tokens.postfix(containing: parsed.remaining))
    }

}
