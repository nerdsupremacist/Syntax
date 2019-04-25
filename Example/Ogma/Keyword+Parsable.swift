//
//  Keyword+Parsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Query.Keyword: Parsable {
    typealias Token = Query.Token

    static let parser: AnyParser<Query.Token, Query.Keyword> = AnyParser
        .consuming(keyPath: \.word)
        .map(Query.Keyword.init)
}
