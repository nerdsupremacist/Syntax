//
//  Parsable+Wrapped.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/29/19.
//

import Foundation

extension Parsable {

    /// Find an occurrence of the parsers value wrapped by a start and end token
    public static func wrapped(by start: Token, and end: Token) -> AnyParser<Token, Self> {
        return indirect.wrapped(by: start, and: end)
    }

}
