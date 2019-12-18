//
//  OptionalParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

postfix operator .?

extension Hashable {

    public func optional() -> AnyParser<Self, Void> {
        return parser.optional().map { _ in () }
    }

}

extension Parser {

    /// Make the value optional. If the value cannot be parsed it will return nil and not consume any tokens
    public func optional() -> AnyParser<Token, Output?> {
        return self.map(Optional.some) || nil
    }
    
}
