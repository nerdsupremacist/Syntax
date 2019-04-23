//
//  Parsable+Map.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension Parsable {

    public static func map<T>(_ transform: @escaping (Self) throws -> T) -> AnyParser<Token, T> {
        return indirect.map(transform)
    }

}
