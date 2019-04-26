//
//  Array+collect.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

extension Sequence {

    func collect<T>(_ transform: (T?, Element) throws -> T) rethrows -> [T] {
        return try reduce(into: []) { $0.append(try transform($0.last, $1)) }
    }
    
}
