//
//  Collection+prefix+postfix.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/29/19.
//

import Foundation

extension Collection where Element: Equatable {

    func prefix<C: Collection>(containing collection: C) -> [Element] where Element == C.Element? {
        guard let first = first, let rhs = collection.first else { return [] }

        guard let lhs = first else { return dropFirst().prefix(containing: collection) }

        guard lhs == rhs else { return [] }

        return [lhs] + dropFirst().prefix(containing: collection.dropFirst())
    }

    func postfix<C: Collection>(containing collection: C) -> [Element] where Element == C.Element? {
        return reversed().prefix(containing: collection).reversed()
    }

}

extension Collection where Self: PrefixProtocol, SubSequence: PrefixProtocol, Element: Equatable {

    public func has(prefix collection: Self) -> Bool {
        guard let first = collection.first else { return true }

        if self.first != first {
            return false
        }

        return dropFirst().has(prefix: collection.dropFirst())
    }

}

extension ArraySlice: PrefixProtocol where Element: Equatable { }

extension Array: PrefixProtocol where Element: Equatable { }
