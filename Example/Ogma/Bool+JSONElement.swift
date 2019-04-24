//
//  Bool+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Bool: JSONElement {
    public static let parser: AnyParser<JSON.Token, Bool> = Token.true.map { true } ||
        Token.false.map { false }

    var json: JSON {
        return .bool(self)
    }
}
