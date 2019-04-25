//
//  Property+Parsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Query.Filter.Property: Parsable {
    typealias Token = Query.Token

    static let parser: AnyParser<Query.Token, Query.Filter.Property> =
        .hashtag &&
        AnyParser
            .consuming(keyPath: \.word)
            .map(Query.Filter.Property.init)
}
