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

    var prefixes: Set<[Source.Token]> {
        return source.prefixes
    }

    func parse(tokens: [Token], stack: [AnyObject]) throws -> ParserOutput<Token, Output> {
        guard !stack.contains(where: { $0 === self }) else { throw ParserError<Token>.recursiveCall(to: source) }
        return try source.parse(tokens: tokens, stack: stack + [self])
    }
}
