//
//  Lexer.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension JSON {

    enum Lexer: GeneratorLexer {
        typealias Token = JSON.Token

        static let generators: Generators = [
            SingleLineCommentTokenGenerator(prefixPattern: "\\/\\/").map { _ in .comment },
            MultiLineCommentTokenGenerator(prefixPattern: "\\/\\*", postfixPattern: "\\*\\/").map { _ in .comment },

            StringLiteralTokenGenerator().map(Token.string),
            StringLiteralTokenGenerator(delimiter: "`", allowsMultiline: true).map(Token.string),
            DoubleLiteralTokenGenerator().map(Token.double),
            IntLiteralTokenGenerator().map(Token.int),

            RegexTokenGenerator(pattern: "\\{").map(to: .openCurlyBracket),
            RegexTokenGenerator(pattern: "\\}").map(to: .closeCurlyBracket),
            RegexTokenGenerator(pattern: "\\[").map(to: .openSquareBracket),
            RegexTokenGenerator(pattern: "\\]").map(to: .closeSquareBracket),
            RegexTokenGenerator(pattern: ",").map(to: .comma),
            RegexTokenGenerator(pattern: ":").map(to: .colon),
            RegexTokenGenerator(pattern: "true\\b").map(to: .true),
            RegexTokenGenerator(pattern: "false\\b").map(to: .false),
            RegexTokenGenerator(pattern: "null\\b").map(to: .null),

            WhiteSpaceTokenGenerator().ignore(),
        ]
    }

}
