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

    func merge(_ action: (Element, Element) throws -> Element?) rethrows -> [Element] {
        let merged: [Element] = try reduce(into: []) { array, element in
            let newElement = try array.last.flatMap { try action($0, element) }
            if let newElement = newElement {
                array.removeLast()
                array.append(newElement)
            } else {
                array.append(element)
            }
        }
        return merged
    }

}
