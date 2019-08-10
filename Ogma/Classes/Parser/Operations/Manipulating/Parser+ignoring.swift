//
//  Parser+ignoring.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/10/19.
//

import Foundation

extension Parser {

    public func ignoring(token: Token) -> AnyParser<Token, Output> {
        return IgnoringParser(source: self, ignoring: token).any()
    }

}

private struct IgnoringParser<Source: Parser>: Parser {
    typealias Token = Source.Token
    typealias Output = Source.Output

    let source: Source
    let ignoring: Token

    func prefixes(stack: [AnyObject]) -> Set<[Source.Token]> {
        return Set(source.prefixes(stack: stack).flatMap { $0.insertingPowerset(ignoring) })
    }

    func parse(tokens: [Source.Token], stack: [AnyObject]) throws -> ParserOutput<Source.Token, Source.Output> {
        let tokens = tokens.filter { ignoring != $0 }
        return try source.parse(tokens: tokens, stack: stack)
    }
}

extension Collection {

    fileprivate func insertingPowerset(_ element: Element) -> [[Element]] {
        guard let first = first else { return [[]] }
        let rest = dropFirst().insertingPowerset(element)
        return [
            rest.map { [element, first] + $0 },
            rest.map { [first] + $0 }
        ].flatMap { $0 }
    }

}
