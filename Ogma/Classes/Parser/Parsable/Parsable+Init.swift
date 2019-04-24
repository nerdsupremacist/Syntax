//
//  Parsable+Init.swift
//  Ogma
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

private struct ParsableValueDidNotUseAllTokens<Token: TokenProtocol, Value: Parsable>: Error {
    let value: Value
    let tokens: [Token]
}

extension Parsable {
    
    public init(tokens: [Token]) throws {
        let output = try Self.parser.parse(tokens: tokens)
        guard output.remaining.isEmpty else {
            throw ParsableValueDidNotUseAllTokens(value: output.output,
                                                  tokens: output.remaining)
        }
        self = output.output
    }
    
}
