//
//  Parsable+Recursive.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension Parsable {

    public static func recursive(with separator: Token) -> AnyParser<Token, [Self]> {
        return indirect.recursive(with: separator)
    }

}
