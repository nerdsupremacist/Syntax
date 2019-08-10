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
    public func map<T>(file: StaticString = #file,
                       line: Int = #line,
                       _ transform: @escaping (Output) throws -> T) -> AnyParser<Token, T> {

        return MappedParser(file: file, line: line, source: self, transform: transform).any()
    }
    
}

private struct MappedParser<Source: Parser, Output>: Parser {
    typealias Token = Source.Token
    let file: StaticString
    let line: Int
    let source: Source
    let transform: (Source.Output) throws -> Output

    var prefixes: Set<[Source.Token]> {
        return source.prefixes
    }

    func parse(tokens: [Source.Token], stack: [AnyObject]) throws -> ParserOutput<Source.Token, Output> {
        return try source.parse(tokens: tokens, stack: stack).map(transform)
    }
}
