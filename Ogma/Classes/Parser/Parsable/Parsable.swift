//
//  Protocol.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public protocol Parsable {
    associatedtype Token: TokenProtocol
    typealias Parser = AnyParser<Token, Self>
    
    static var parser: Parser { get }
}
