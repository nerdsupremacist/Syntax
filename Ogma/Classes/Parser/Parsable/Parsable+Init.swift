//
//  Parsable+Init.swift
//  Ogma
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parsable {
    
    public init(tokens: [Token]) throws {
        let output = try Self.parser.parse(tokens: tokens)
        guard output.remaining.isEmpty else {
            throw ParserError.parsableValueDidNotConsumeAllTokens(Self.self, remaining: output.remaining)
        }
        self = output.output
    }
    
}
