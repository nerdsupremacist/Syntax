//
//  JSON+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension JSON: JSONParsable {

    public static let parser: AnyParser<Token, JSON> = Bool.map(JSON.bool) ||
        Int.map(JSON.int) ||
        Double.map(JSON.double) ||
        String.map(JSON.string) ||
        Token.null.map { JSON.null } ||
        Array<JSON>.map(JSON.array) ||
        Dictionary<String, JSON>.map(JSON.dictionary)

}
