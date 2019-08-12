//
//  Query+Operator.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/29/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Query.Filter {

    enum Operator: Int, CaseIterable, Comparable {
        case and
        case or
    }

}

extension Query.Filter.Operator: BinaryOperator {
    var token: Query.Token {
        switch self {
        case .and:
            return .and
        case .or:
            return .or
        }
    }

    var associativity: Associativity {
        switch self {
        case .and:
            return .right
        case .or:
            return .left
        }
    }
}

extension Query.Filter: MemberOfBinaryOperation {
    init(from operation: BinaryOperation<Query.Filter>) {
        self = .operation(operation)
    }
}
