//
//  Array+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Array: Parsable where Element == JSON {
    public typealias Token = JSON.Token

    public static let parser: AnyParser<JSON.Token, Array<JSON>> = JSON
        .indirect
        .recursive(with: .comma)
        .wrapped(by: .openSquareBracket, and: .closeSquareBracket)
}

extension Array: JSONElement where Element == JSON {

    var json: JSON {
        return .array(self)
    }

}
