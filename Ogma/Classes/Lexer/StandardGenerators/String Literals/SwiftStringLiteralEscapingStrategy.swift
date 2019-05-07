//
//  SwiftStringLiteralEscapingStrategy.swift
//  Ogma
//
//  Created by Mathias Quintero on 5/6/19.
//

import Foundation

public enum SwiftStringLiteralEscapingStrategy: UnicodeStringLiteralEscapingStrategy {
    public static let pattern: String = "u\\{([0-9a-fA-F]{1,8})\\}"
    public static let group: Int = 1
}
