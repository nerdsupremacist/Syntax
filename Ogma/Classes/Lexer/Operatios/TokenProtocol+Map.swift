//
//  TokenProtocol+Map.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenProtocol {

    /// Returns a Parser that matches the Token to a Value of T
    public func map<T>(_ transform: @escaping () throws -> T) -> AnyParser<Self, T> {
        return parser.map(transform)
    }

    /// Returns a Parser that matches the Token to a Value of T
    public func map<T>(to value: T) -> AnyParser<Self, T> {
        return map { value }
    }

}
