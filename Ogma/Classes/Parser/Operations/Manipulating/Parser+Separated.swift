//
//  RecusriveParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    // [Self]([Separator][Self])* when empty is not allowed
    // [Self]([Separator][Self])*? when empty is allowed
    /// Find n occurrences of the parsers value separated by a specific Token.
    public func separated(by separator: Token, allowsEmpty: Bool = false) -> AnyParser<Token, [Output]> {

        if allowsEmpty {
            return separated(by: separator, allowsEmpty: false)
                .optional()
                .map { $0 ?? [] }
        }

        let subsequent = separator && self
        let parser = self && subsequent*
        return parser.map { [$0] + $1 }
    }
    
}
