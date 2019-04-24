//
//  Protocol.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// A Value that can be parsed
public protocol Parsable {
    /// Tokens that the Values parser is expecting
    associatedtype Token: TokenProtocol
    typealias Parser = AnyParser<Token, Self>

    /// Parser that should be used to parse the value
    static var parser: Parser { get }
}
