//
//  Filter+Parsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Query.Filter: Parsable {
    typealias Token = Query.Token

    static let parser: AnyParser<Query.Token, Query.Filter> = BinaryOperation.map(Query.Filter.operation) ||
        Query.Filter.Equality.map(Query.Filter.equality) ||
        Query.Filter.wrapped(by: .openParenthesis, and: .closeParenthesis).map { .wrapped($0) }
}
