//
//  Double+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Double: JSONParsable {
    public static var parser: AnyParser<Token, Double> = Token.parser(for: \.double)
}
