//
//  JSON+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension JSON: Parsable {

    public static let parser: AnyParser<Token, JSON> =
        Array<JSON>.map(JSON.array) ||
        Dictionary<String, JSON>.map(JSON.dictionary) ||
        AnyParser.consuming { token in
            switch token {
            case .true:
                return .bool(true)
            case .false:
                return .bool(false)
            case .int(let int):
                return .int(int)
            case .double(let double):
                return .double(double)
            case .string(let string):
                return .string(string)
            case .null:
                return .null
            default:
                return nil
            }
        }

}
