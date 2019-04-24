//
//  Parsable+Recursive.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension Parsable {

    public static func separated(by separator: Token, allowsEmpty: Bool = false) -> AnyParser<Token, [Self]> {
        return indirect.separated(by: separator, allowsEmpty: allowsEmpty)
    }

}
