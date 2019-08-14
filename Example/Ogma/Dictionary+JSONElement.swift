//
//  Dictionary+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Dictionary: Parsable where Key == String, Value == JSON {

    public typealias Token = JSON.Token

    public static let parser: AnyParser<JSON.Token, Dictionary<String, JSON>> =
        AnyParser.consuming(keyPath: \.string)
            .and(.colon)
            .and(JSON.self)
            .separated(by: .comma, allowsTrailingSeparator: true, allowsEmpty: true)
            .map { Dictionary($0, uniquingKeysWith: { $1 }) }
            .wrapped(by: .openCurlyBracket, and: .closeCurlyBracket)

}

