//
//  Query.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

struct Query {
    let keywords: [Keyword]
    let filter: Filter?
}

extension Query {

    struct Keyword: RawRepresentable {
        let rawValue: String
    }

}

extension Query {

    indirect enum Filter {
        case equality(Equality)
        case wrapped(Query.Filter)
        case operation(BinaryOperation<Query.Filter>)
    }

}

extension Query.Filter {

    struct Property: RawRepresentable {
        let rawValue: String
    }

    struct Value: RawRepresentable {
        let rawValue: String
    }

    struct Equality {
        let property: Property
        let value: Value
    }
}

extension Query {

    static func parse(_ input: String) throws -> Query {
        return try parse(input, using: Lexer.self)
    }

}
