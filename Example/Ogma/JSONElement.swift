//
//  JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

protocol JSONElement: Parsable where Token == JSON.Token {
    static var parser: Parser { get }
    var json: JSON { get }
}

extension JSONElement {

    static var json: AnyParser<JSON.Token, JSON> {
        return parser.map {  $0.json }
    }

}
