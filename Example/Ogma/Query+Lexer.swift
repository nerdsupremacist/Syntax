//
//  Query+Lexer.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Ogma

extension Query {

    enum Lexer: GeneratorLexer {
        typealias Token = Query.Token

        static let generators: Generators = [
            WhiteSpaceTokenGenerator().ignore(),
            RegexTokenGenerator(pattern: "&").map(to: .and),
            RegexTokenGenerator(pattern: "#").map(to: .hashtag),
            RegexTokenGenerator(pattern: "=").map(to: .equals),
            RegexTokenGenerator(pattern: "\\w+\\b").map { .word($0) },
            StringLiteralTokenGenerator().map { .string($0) },
        ]
    }

}
