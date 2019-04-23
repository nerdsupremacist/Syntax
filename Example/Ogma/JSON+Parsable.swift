//
//  JSON+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension JSON: Parsable {
    public static let parser: AnyParser<Token, JSON> = Bool.json ||
        Int.json ||
        Double.json ||
        String.json ||
        Token.null.map { .null } ||
        Array<JSON>.json ||
        Dictionary<String, JSON>.json
}
