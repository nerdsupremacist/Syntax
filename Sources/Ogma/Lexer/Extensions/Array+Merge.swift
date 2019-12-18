//
//  Array+Merge.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

extension Array {

    func merge(_ combine: (Element, Element) throws -> Element?) rethrows -> [Element] {
        let merged: [Element] = try reduce(into: []) { array, element in
            let newElement = try array.last.flatMap { try combine($0, element) }
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
