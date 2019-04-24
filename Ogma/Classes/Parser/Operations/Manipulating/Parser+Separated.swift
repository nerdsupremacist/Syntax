//
//  RecusriveParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    // [Self]([Separator][Self])*
    public func separated(by separator: Token) -> AnyParser<Token, [Output]> {
        let subsequent = separator && self
        let parser = self && subsequent*
        return parser.map { [$0] + $1 }
    }
    
}
