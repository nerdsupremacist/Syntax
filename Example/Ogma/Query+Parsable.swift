//
//  Query+Parsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Query: Parsable {
    static let parser: AnyParser<Query.Token, Query> = {
        let parser = Keyword.self* && Filter?.self
        return parser.map { Query(keywords: $0, filter: $1) }
    }()
}
