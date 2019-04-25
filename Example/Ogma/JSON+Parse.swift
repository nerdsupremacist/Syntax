//
//  JSONParser.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

extension JSON {

    static func parse(_ input: String) throws -> JSON {
        return try parse(input, using: Lexer.self)
    }

}
