//
//  Parser+excluding.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/29/19.
//

import Foundation

extension Parser {

    public func excludingRecursion() -> AnyParser<Token, Output> {
        return SelfExcludingParser(source: self).any()
    }

}

private class SelfExcludingParser<Source: Parser>: Parser {
    typealias Token = Source.Token
    typealias Output = Source.Output

    let source: Source

    init(source: Source) {
        self.source = source
    }

    func prefixes(stack: [AnyObject]) -> Set<Prefix<Source.Token>> {
        // In case of recursion pretend there are no available prefixes
        guard !stack.contains(where: { $0 === self }) else { return [[]] }
        return source.prefixes(stack: stack + [self])
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        guard !stack.contains(where: { $0 === self }) else {
            throw ParserError<Token>.recursiveCall(to: source)
        }
        return try source.parse(tokens: tokens, stack: stack + [self])
    }
}
