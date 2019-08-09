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

    public static let parser: AnyParser<Token, JSON> = .lookAhead { token in
        switch token {
        case .openSquareBracket:
            return Array<JSON>.indirect.map(JSON.array)
        case .openCurlyBracket:
            return Dictionary<String, JSON>.indirect.map(JSON.dictionary)
        case .true:
            return .with(value: .bool(true))
        case .false:
            return .with(value: .bool(false))
        case .int(let int):
            return .with(value: .int(int))
        case .double(let double):
            return .with(value: .double(double))
        case .string(let string):
            return .with(value: .string(string))
        case .null:
            return .with(value: .null)
        case .closeSquareBracket, .closeCurlyBracket, .comma, .colon:
            return nil
        }
    }

}
