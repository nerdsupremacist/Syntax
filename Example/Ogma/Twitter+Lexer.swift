//
//  TwitterLexer.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/26/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

enum Twitter {

    enum Token: TokenProtocol {
        case mention(String)
        case hashtag(String)
    }

    enum Lexer: GeneratorLexer {
        typealias Token = Twitter.Token

        static let generators: Generators = [
            RegexTokenGenerator(pattern: "@(\\w+)", group: 1).map { .mention($0) },
            RegexTokenGenerator(pattern: "#(\\w+)", group: 1).map { .hashtag($0) },
        ]
    }

}
