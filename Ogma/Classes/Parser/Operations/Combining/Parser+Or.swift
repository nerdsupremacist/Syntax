//
//  OrParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// Create a Parser that return the first succesfull result from two Parsers
public func ||<A: Parser, B: Parser>(lhs: A,
                                     rhs: B) -> AnyParser<A.Token, A.Output> where A.Output == B.Output, A.Token == B.Token {

    return OrParser(parsers: lhs.underlyingParsers() + rhs.underlyingParsers()).any()
}

fileprivate extension Parser {

    func underlyingParsers() -> [AnyParser<Token, Output>] {
        if let parser = self as? OrParser<Token, Output> {
            return parser.parsers
        }
        guard let any = self as? AnyParser<Token, Output> else {
            return [self.any()]
        }

        if let parser = any._source as? OrParser<Token, Output> {
            return parser.parsers
        }

        return [any]
    }

}

private class OrParser<Token: Hashable, Output>: Parser {
    fileprivate let parsers: [AnyParser<Token, Output>]

    fileprivate private(set) lazy var parser: AnyParser<Token, Output> = { [unowned self] in
        let prefixes = self.parsers.flatMap { parser in parser.prefixes.map { ($0, parser) } }
        let count = prefixes.map { $0.0.count }.max() ?? 0
        let parserMap = Dictionary(grouping: prefixes, by: { $0.0 }).mapValues { $0.map { $0.1 } }

        return .lookAhead(count) { tokens in
            let parsers = parserMap.get(prefix: tokens).flatMap { $0 }
            return BacktrackingOrParser(parsers: parsers).any()
        }
    }()

    var prefixes: Set<[Token]> {
        return parsers.reduce([]) { $0.union($1.prefixes) }
    }

    init(parsers: [AnyParser<Token, Output>]) {
        self.parsers = parsers
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        return try parser.parse(tokens: tokens)
    }
}

private struct BacktrackingOrParser<Token: TokenProtocol, Output>: Parser {
    let parsers: [AnyParser<Token, Output>]

    var prefixes: Set<[Token]> {
        return parsers.reduce([]) { $0.union($1.prefixes) }
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        return try parse(tokens: tokens, stack: stack, parsers: parsers)
    }

    private func parse(tokens: [Token],
                       stack: [AnyObject],
                       parsers: [AnyParser<Token, Output>]) throws -> ParserOutput<Token, Output> {

        guard let first = parsers.first else {
            throw ParserError.backtrackingFailed(parsers: self.parsers, tokens: tokens)
        }

        do {
            return try first.parse(tokens: tokens, stack: stack)
        } catch {
            return try parse(tokens: tokens, stack: stack, parsers: Array(parsers.dropFirst()))
        }
    }
}
