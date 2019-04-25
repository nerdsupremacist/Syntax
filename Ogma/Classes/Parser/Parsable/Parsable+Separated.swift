//
//  Parsable+Recursive.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension Parsable {

    /// Returns a parser that will parse the Value n times separated by a separator Token
    public static func separated(by separator: Token,
                                 allowsTrailingSeparator: Bool = false,
                                 allowsEmpty: Bool = false) -> AnyParser<Token, [Self]> {

        return indirect.separated(by: separator,
                                  allowsTrailingSeparator: allowsTrailingSeparator,
                                  allowsEmpty: allowsEmpty)
    }

}
