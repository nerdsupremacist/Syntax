//
//  JSON.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public enum JSON {
    case dictionary([String : JSON])
    case array([JSON])
    case int(Int)
    case double(Double)
    case string(String)
    case bool(Bool)
    case null
}
