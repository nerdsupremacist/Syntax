//
//  Parser+Map.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {

    /// Map the output value of a Parser
    public func map<T>(_ transform: @escaping (Output) throws -> T) -> AnyParser<Token, T> {
        return MappedParser(source: self, transform: transform).any()
    }
    
}

private struct MappedParser<Source: Parser, Output>: Parser {
    typealias Token = Source.Token
    let source: Source
    let transform: (Source.Output) throws -> Output
    
    func parse(tokens: [Token]) throws -> ParserOutput<Token, Output> {
        return try source.parse(tokens: tokens).map(transform)
    }
}
