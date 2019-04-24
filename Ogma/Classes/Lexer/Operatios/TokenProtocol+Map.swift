//
//  TokenProtocol+Map.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenProtocol {

    public func map<T>(_ transform: @escaping () throws -> T) -> AnyParser<Self, T> {
        return parser.map(transform)
    }

}
