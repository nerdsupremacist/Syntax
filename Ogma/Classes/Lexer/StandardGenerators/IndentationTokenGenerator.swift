//
//  IndentationTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/25/19.
//

import Foundation

public struct Indentation: TokenProtocol {
    public let level: UInt
}

public struct IndentationTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = Indentation

    let width: UInt

    public var pattern: String {
        return "([ ]{\(width)})+|(\\t)+"
    }

    public init(width: UInt) {
        self.width = width
    }

    public func token(from matched: String) throws -> Indentation? {
        let count = UInt(matched.count)

        if matched.contains("\t") {
            return Indentation(level: count)
        }

        if matched.contains(" ") {
            return Indentation(level: count / width)
        }

        fatalError("Matched string doesn't contain neither tabs nor spaces")
    }
}
