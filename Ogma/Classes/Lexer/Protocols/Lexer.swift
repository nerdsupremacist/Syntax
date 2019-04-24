//
//  Lexer.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public protocol LexerProtocol {
    associatedtype Token: TokenProtocol
    static func tokenize(input: String) throws -> [Token]
}
