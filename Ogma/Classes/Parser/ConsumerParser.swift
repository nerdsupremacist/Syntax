//
//  TokenKeyPathParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension AnyParser {

    /// Returns a Parser that will attempt to read a property from the Token.
    /// If the property has a value it will return the value, otherwise throw an error
    public static func consuming(file: StaticString = #file,
                                 line: Int = #line,
                                 _ closure: @escaping (Token) throws -> Output?) -> AnyParser<Token, Output> {

        return ConsumerParser(file: file, line: line, closure: closure).any()
    }

    /// Returns a Parser that will attempt to read a property from the Token.
    /// If the property has a value it will return the value, otherwise throw an error
    public static func consuming(file: StaticString = #file,
                                 line: Int = #line,
                                 keyPath: KeyPath<Token, Output?>) -> AnyParser<Token, Output> {

        return .consuming { $0[keyPath: keyPath] }
    }

}

private struct ConsumerParser<Token: TokenProtocol, Output>: SingleTokenParser {
    let file: StaticString
    let line: Int
    let closure: (Token) throws -> Output?

    func prefixes(stack: [AnyObject]) -> Set<Prefix<Token>> {
        return [.consuming]
    }

    func parse(token: Token, stack: [AnyObject]) throws -> Output {
        guard let value = try closure(token) else {
            throw ParserError.tokenNotConvertibleTo(token, type: Output.self)
        }
        return value
    }
}
