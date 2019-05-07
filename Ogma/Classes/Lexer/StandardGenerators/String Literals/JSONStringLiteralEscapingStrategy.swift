//
//  JSONStringLiteralEscapingStrategy.swift
//  Ogma
//
//  Created by Mathias Quintero on 5/7/19.
//

import Foundation

public enum JSONStringLiteralEscapingStrategy: UnicodeStringLiteralEscapingStrategy {
    public static let pattern: String = "u([0-9a-fA-F]{4})"
    public static let group: Int = 1
}
