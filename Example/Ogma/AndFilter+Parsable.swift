//
//  AndFilter+Parsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Query.Filter.AndFilter: Parsable {
    typealias Token = Query.Token

    static let parser: AnyParser<Query.Token, Query.Filter.AndFilter> = {
        let parser = Query.Filter.Equality.self && .and && Query.Filter.self
        return parser.map { Query.Filter.AndFilter(lhs: .equality($0), rhs: $1) }
    }()
}
