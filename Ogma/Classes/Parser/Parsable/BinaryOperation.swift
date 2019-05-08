//
//  BinaryOperation.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/29/19.
//

import Foundation

public protocol BinaryOperator: CaseIterable, Comparable {
    associatedtype Token
    var token: Token { get }
}

public protocol MemberOfBinaryOperation: Parsable {
    associatedtype Operator: BinaryOperator where Operator.Token == Token

    init(from operation: BinaryOperation<Self>)
}

public struct BinaryOperation<Member: MemberOfBinaryOperation> {
    public let lhs: Member
    public let rhs: Member
    public let `operator`: Member.Operator
}

extension BinaryOperation: Parsable {
    public typealias Token = Member.Token

    public static var parser: AnyParser<Token, BinaryOperation<Member>> {
        let member = Member
            .map { Output.member($0) }
            .excludingRecursion()

        let parser: AnyParser<Token, Output> = Member.Operator
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
        case member(Member)
        case operation(BinaryOperation<Member>)

        var member: Member {
            switch self {
            case .member(let member):
                return member
            case .operation(let operation):
                return Member(from: operation)
            }
        }
    }

    private static func parser(using parser: AnyParser<Token, Output>,
                               for operator: Member.Operator) -> AnyParser<Token, Output> {

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

extension BinaryOperator {

    static var operators: [Self] {
        return allCases.sorted()
    }

}
