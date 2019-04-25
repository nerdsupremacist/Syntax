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

    static let parser: AnyParser<Query.Token, Query.Filter> = Query.Filter.AndFilter.map(Query.Filter.and) ||
        Query.Filter.Equality.map(Query.Filter.equality)
}
