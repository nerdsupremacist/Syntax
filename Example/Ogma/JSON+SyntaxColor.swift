//
//  JSON+SyntaxColor.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 8/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension JSON.Token {

    var color: UIColor {
        switch self {
        case .openCurlyBracket, .closeCurlyBracket:
            return .black
        case .openSquareBracket, .closeSquareBracket:
            return .black
        case .comma, .colon:
            return .black
        case .true, .false:
            return .blue
        case .double, .int:
            return .red
        case .string:
            return .orange
        case .null:
            return .blue
        case .comment:
            return UIColor.gray.withAlphaComponent(0.75)
        }
    }

}
