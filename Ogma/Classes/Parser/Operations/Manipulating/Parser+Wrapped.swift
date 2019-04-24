//
//  WrappedParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    public func wrapped(by start: Token, and end: Token) -> AnyParser<Token, Output> {
        return start && self && end
    }
    
}
