//
//  Parser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public protocol Parser {
    associatedtype Token: TokenProtocol
    associatedtype Output
    func parse(tokens: [Token]) throws -> ParserOutput<Token, Output>
}
