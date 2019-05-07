//
//  RawRepresentable+Comparable.swift
//  Ogma
//
//  Created by Mathias Quintero on 5/7/19.
//

import Foundation

extension RawRepresentable where RawValue: Comparable, Self: Comparable {

    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

}
