//
//  Dictionary+Parser.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/8/19.
//

import Foundation

extension AnyParser {
    public static func lookAhead(_ depth: Int,
                                 _ parsers: @escaping ([Token]) -> AnyParser<Token, Output>?) -> AnyParser<Token, Output> {

        return PrefixLookAheadParser(depth: depth, parsers).any()
    }

    public static func lookAhead(_ parsers: @escaping (Token) -> AnyParser<Token, Output>?) -> AnyParser<Token, Output> {
        return .lookAhead(1) { $0.first.flatMap(parsers) }
    }

    public static func lookAhead(_ parsers: @escaping (Token, Token?) -> AnyParser<Token, Output>?) -> AnyParser<Token, Output> {
        return .lookAhead(2) { tokens in
            guard let first = tokens.first else { return nil }
            return parsers(first, tokens.last)
        }
    }
}

extension AnyParser where Token: Hashable {
    public static func lookAhead(using dictionary: [Token : AnyParser<Token, Output>]) -> AnyParser<Token, Output> {
        return .lookAhead { dictionary[$0] }
    }
}

extension AnyParser: ExpressibleByDictionaryLiteral where Token: Hashable {
    public typealias Key = Token
    public typealias Value = AnyParser<Token, Output>

    public init(dictionaryLiteral elements: (Token, AnyParser<Token, Output>)...) {
        self = .lookAhead(using: Dictionary(elements, uniquingKeysWith: { $1 }))
    }
}

extension Array {

    func first(_ n: Int) -> [Element] {
        return Array(dropLast(count - n))
    }

}

private struct PrefixLookAheadParser<Token: TokenProtocol, Output>: Parser {
    private let depth: Int
    private let parsers: ([Token]) -> AnyParser<Token, Output>?

    init(depth: Int, _ parsers: @escaping ([Token]) -> AnyParser<Token, Output>?) {
        self.depth = depth
        self.parsers = parsers
    }

    var prefixes: Set<[Token]> {
        return [[]]
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        guard !tokens.isEmpty else { throw ParserError<Token>.noMoreTokens }
        let prefix = tokens.first(depth)
        guard let parser = parsers(prefix) else { throw ParserError.lookaheadFailedToReturnSubParser(basedOn: prefix) }
        return try parser.parse(tokens: tokens, stack: stack)
    }
}

extension Dictionary {

    func get<SubKey: Hashable>(prefix: [SubKey]) -> [Value] where Array<SubKey> == Key {
        let values = filter { prefix.hasPrefix($0.key) }
            .values
        return Array(values)
    }

}
