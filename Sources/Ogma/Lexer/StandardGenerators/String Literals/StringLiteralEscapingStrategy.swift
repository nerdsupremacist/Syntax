//
//  StringLiteralEscapingStrategy.swift
//  Ogma
//
//  Created by Mathias Quintero on 5/6/19.
//

import Foundation

public protocol StringLiteralEscapingStrategy {
    static func escaped(character: Character) throws -> String
    static func escaped(string: String) throws -> String
}
