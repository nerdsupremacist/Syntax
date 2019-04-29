//
//  BinaryOperation.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/29/19.
//

import Foundation

public protocol ParsableBinaryOperator: CaseIterable, Comparable {
    associatedtype Token
    associatedtype Member: MemberOfBinaryOperation where Member.Token == Token, Member.Operator == Self

    var token: Token { get }
}

public protocol MemberOfBinaryOperation: Parsable {
    associatedtype Operator: ParsableBinaryOperator

    init(from operation: BinaryOperation<Operator>)
}

public struct BinaryOperation<Operator: ParsableBinaryOperator> {
    let lhs: Operator.Member
    let rhs: Operator.Member
    let `operator`: Operator
}

extension BinaryOperation: Parsable {
    public typealias Token = Operator.Token

    public static var parser: AnyParser<Token, BinaryOperation<Operator>> {
        let member = Operator.Member
            .map { Output.member($0) }
            .excludingRecursion()

        let parser: AnyParser<Token, Output> = Operator
            .operators
            .reduce(member) { self.parser(using: $0, for: $1) }

        return parser.map { value in
            guard case .operation(let operation) = value else { throw ParserError<Token>.expectedABinaryOperation }
            return operation
        }
    }
}

extension BinaryOperation {

    private enum Output {
        case member(Operator.Member)
        case operation(BinaryOperation<Operator>)

        var member: Operator.Member {
            switch self {
            case .member(let member):
                return member
            case .operation(let operation):
                return Operator.Member(from: operation)
            }
        }
    }

    private static func parser(using parser: AnyParser<Token, Output>,
                               for operator: Operator) -> AnyParser<Token, Output> {

        let parser = parser && (`operator`.token && parser)*
        return parser.map {
            $1.reduce($0) { lhs, rhs in
                return .operation(BinaryOperation(lhs: lhs.member,
                                                  rhs: rhs.member,
                                                  operator: `operator`))
            }
        }
    }

}

extension ParsableBinaryOperator {

    static var operators: [Self] {
        return allCases.sorted()
    }

}
