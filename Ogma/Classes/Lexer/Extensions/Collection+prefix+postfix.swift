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

    func hasPrefix<C: Collection>(_ collection: C) -> Bool where Element == C.Element {
        guard let first = collection.first else { return true }

        if self.first != first {
            return false
        }

        return dropFirst().hasPrefix(collection.dropFirst())
    }

}
