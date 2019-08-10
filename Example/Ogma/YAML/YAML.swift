//
//  YAML.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 8/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

enum YAML {
    enum Key: Hashable {
        case string(String)
        case sequence([String])
    }

    enum Element {
        case data(Data)
        case string(String)
        case int(Int)
        case double(Double)
        case bool(Bool)
    }

    case array([YAML])
    case dictionary([Key : YAML])
    case element(Element)
}
