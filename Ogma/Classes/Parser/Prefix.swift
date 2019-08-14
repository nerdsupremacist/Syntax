//
//  Prefix.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/14/19.
//

import Foundation

public protocol PrefixProtocol {
    var count: Int { get }
    func has(prefix: Self) -> Bool
}

public enum Prefix<Token: TokenProtocol>: Hashable {
    case tokens([Token])
    case consuming
}

extension Prefix: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: Token...) {
        self = .tokens(elements)
    }

}

extension Prefix: PrefixProtocol {

    public var count: Int {
        switch self {
        case .tokens(let tokens):
            return tokens.count
        case .consuming:
            return 1
        }
    }

    public func has(prefix: Prefix<Token>) -> Bool {
        switch (self, prefix) {
        case (_, .consuming):
            return true
        case (.tokens(let lhs), .tokens(let rhs)):
            return lhs.has(prefix: rhs)
        default:
            return false
        }
    }

}
