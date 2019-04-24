//
//  ParserOutput.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public struct ParserOutput<Token: TokenProtocol, T> {
    let output: T
    let remaining: [Token]
}

extension ParserOutput {
    
    public func map<V>(_ transform: (T) throws -> V) rethrows -> ParserOutput<Token, V> {
        return ParserOutput<Token, V>(output: try transform(output), remaining: remaining)
    }
    
}
