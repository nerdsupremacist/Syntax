//
//  JSON.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public enum JSON {
    case dictionary([String : JSON])
    case array([JSON])
    case int(Int)
    case double(Double)
    case string(String)
    case bool(Bool)
    case null
}

extension JSON {

    var valueDescription: String {
        switch self {
        case .dictionary:
            return "Object"
        case .array:
            return "Array"
        case .int(let int):
            return String(int)
        case .double(let double):
            return String(double)
        case .string(let string):
            return "\"\(string)\""
        case .bool(let bool):
            return String(bool)
        case .null:
            return "null"
        }
    }

}
