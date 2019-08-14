//
//  RegexTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/25/19.
//

import Foundation

public enum Regex {
    case substring(String, wordBoundary: Bool?)
    case pattern(String)
}

extension Regex {

    public static func substring(_ string: String) -> Regex {
        return .substring(string, wordBoundary: nil)
    }

    public static func word(_ string: String) -> Regex {
        return .substring(string, wordBoundary: true)
    }

    public static func notWord(_ string: String) -> Regex {
        return .substring(string, wordBoundary: false)
    }

    var pattern: String {
        switch self {
        case .substring(let string, .some(true)):
            return NSRegularExpression.escapedPattern(for: string) + "\\b"
        case .substring(let string, .some(false)):
            return NSRegularExpression.escapedPattern(for: string) + "\\B"
        case .substring(let string, wordBoundary: .none):
            return NSRegularExpression.escapedPattern(for: string)
        case .pattern(let pattern):
            return pattern
        }
    }

}

extension Regex: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self = .substring(value)
    }

}

public struct RegexTokenGenerator: SingleGroupRegexTokenGenerator {
    public typealias Token = String

    public let pattern: String
    public let group: Int

    private init(regex: Regex, group: Int) {
        self.pattern = regex.pattern
        self.group = group
    }

    public init(notWord substring: String) {
        self.init(regex: .notWord(substring), group: 0)
    }

    public init(word substring: String) {
        self.init(regex: .word(substring), group: 0)
    }

    public init(string substring: String) {
        self.init(regex: .substring(substring), group: 0)
    }

    public init(pattern: String, group: Int = 0) {
        self.init(regex: .pattern(pattern), group: group)
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
