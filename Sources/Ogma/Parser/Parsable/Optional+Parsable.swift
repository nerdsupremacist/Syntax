//
//  Optional+Parsable.swift
//  Ogma
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Optional: Parsable where Wrapped: Parsable {
    public typealias Token = Wrapped.Token
    
    public static var parser: AnyParser<Token, Wrapped?> {
        return Wrapped.parser.optional()
    }
}
