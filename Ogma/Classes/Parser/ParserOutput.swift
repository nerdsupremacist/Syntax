//
//  ParserOutput.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// Wrapper around the Output of a Parser, containing the Value and the remaining Tokens that were not consumed yet
public struct ParserOutput<Token: TokenProtocol, T> {
    let output: T
    let remaining: [Token]
}

extension ParserOutput {

    /// Transform the output to another type
    public func map<V>(_ transform: (T) throws -> V) rethrows -> ParserOutput<Token, V> {
        return ParserOutput<Token, V>(output: try transform(output), remaining: remaining)
    }

}
