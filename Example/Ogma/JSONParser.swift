//
//  JSONParser.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

enum JSONParser {

    public static func json(from input: String) throws -> JSON {
        let tokens = try Lexer.tokenize(input: input)
        return try JSON(tokens: tokens)
    }

}
