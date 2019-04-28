//
//  JSON.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

@dynamicMemberLookup
public enum JSON {
    case dictionary([String : JSON])
    case array([JSON])
    case int(Int)
    case double(Double)
    case string(String)
    case bool(Bool)
    case null

    public subscript(dynamicMember member: String) -> JSON? {
        if case .array(let array) = self,
            let number = Int(member),
            number < array.count {
            
            return array[number]
        }

        guard case .dictionary(let dictionary) = self else { return nil }
        return dictionary[member]
    }
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

    var typeTitle: String {
        switch self {
        case .dictionary:
            return "Object"
        case .array:
            return "Array"
        case .int:
            return "Integer"
        case .double:
            return "Double"
        case .string:
            return "String"
        case .bool:
            return "Boolean"
        case .null:
            return "null"
        }
    }

}
