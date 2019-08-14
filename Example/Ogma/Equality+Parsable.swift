//
//  EqualityFilter.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Query.Filter.Equality: Parsable {
    typealias Token = Query.Token

    static let parser: AnyParser<Query.Token, Query.Filter.Equality> = Query.Filter.Property
        .and(.equals)
        .and(Query.Filter.Value.self)
        .map { Query.Filter.Equality(property: $0, value: $1) }
}
