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

    public static let parser: AnyParser<Token, JSON> = Bool.parser.map(JSON.bool) ||
        Int.parser.map(JSON.int) ||
        Double.parser.map(JSON.double) ||
        String.parser.map(JSON.string) ||
        Token.null.parser.map { JSON.null } ||
        Array<JSON>.parser.map(JSON.array) ||
        Dictionary<String, JSON>.parser.map(JSON.dictionary)

}
