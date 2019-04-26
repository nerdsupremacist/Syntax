//
//  RegexTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/25/19.
//

import Foundation

public struct RegexTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = String

    public let pattern: String
    public let group: Int

    public init(pattern: String, group: Int = 0) {
        self.pattern = pattern
        self.group = group
    }

    public func token(from matched: String) throws -> String? {
        return matched
    }
}

extension RegexTokenGenerator {

    /// Map the matched regex to a Value
    public func map<T: TokenProtocol>(_ value: @escaping () throws -> T) -> AnyTokenGenerator<T> {
        return map { _ in try value() }
    }

    /// Map the matched regex to a Value
    public func map<T: TokenProtocol>(to value: T) -> AnyTokenGenerator<T> {
        return map { value }
    }

}
