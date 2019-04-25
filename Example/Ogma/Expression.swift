//
//  Expression.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/24/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

public indirect enum Expression {

    public struct Addition {
        let lhs: Expression
        let rhs: Expression
    }

    public struct Multiplication {
        let lhs: Expression
        let rhs: Expression
    }

    case int(Int)
    case addition(Addition)
    case multiplication(Multiplication)
}

extension Expression {

    func eval() -> Int {
        switch self {
        case .int(let int):
            return int
        case .addition(let addition):
            return addition.lhs.eval() + addition.rhs.eval()
        case .multiplication(let multiplication):
            return multiplication.lhs.eval() * multiplication.rhs.eval()
        }
    }

}

extension Expression {

    public enum Token: TokenProtocol {
        case int(Int)

        case plus
        case times
    }

}

extension Expression {

    enum Lexer: GeneratorLexer {
        typealias Token = Expression.Token

        static let generator: AnyTokenGenerator<Token> = {
            return [
                Int.generator.map(Token.int),
                Token.plus.generator(with: "\\+"),
                Token.times.generator(with: "\\*"),
            ].any()
        }()
    }


}

extension Expression.Token {
    var int: Int? {
        guard case .int(let int) = self else { return nil }
        return int
    }
}

extension Int: Parsable {
    public typealias Token = Expression.Token

    public static let parser: AnyParser<Expression.Token, Int> = Token.parser(for: \.int)
}

extension Expression.Addition: Parsable {
    public typealias Token = Expression.Token

    public static let parser: AnyParser<Expression.Token, Expression.Addition> = {
        let parser = Int.self && .plus && Expression.self
        return parser.map { Expression.Addition(lhs: .int($0), rhs: $1) }
    }()
}

extension Expression.Multiplication: Parsable {
    public typealias Token = Expression.Token

    public static let parser: AnyParser<Expression.Token, Expression.Multiplication> = {
        let parser = Int.self && .times && Expression.self
        return parser.map { Expression.Multiplication(lhs: .int($0), rhs: $1) }
    }()
}

extension Expression: Parsable {

    public static let parser: AnyParser<Expression.Token, Expression> = Addition.map(Expression.addition) ||
        Multiplication.map(Expression.multiplication) ||
        Int.map(Expression.int)

}


extension String {

    func calculate() throws -> Int {
        return try Expression.Lexer.parse(input: self, of: Expression.self).eval()
    }

}
