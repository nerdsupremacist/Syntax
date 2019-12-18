//
//  Optional+Filter.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

extension Optional {

    func filter(_ isIncluded: (Wrapped) throws -> Bool) rethrows -> Wrapped? {
        guard let value = self, try isIncluded(value) else { return nil }
        return value
    }

}
