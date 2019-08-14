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
            SingleLineCommentTokenGenerator(prefix: "//").ignore(),
            MultiLineCommentTokenGenerator(prefix: "/*", postfix: "*/").ignore(),

            StringLiteralTokenGenerator().map(Token.string),
            StringLiteralTokenGenerator(delimiter: "`", allowsMultiline: true).map(Token.string),
            DoubleLiteralTokenGenerator().map(Token.double),
            IntLiteralTokenGenerator().map(Token.int),

            RegexTokenGenerator(string: "{").map(to: .openCurlyBracket),
            RegexTokenGenerator(string: "}").map(to: .closeCurlyBracket),
            RegexTokenGenerator(string: "[").map(to: .openSquareBracket),
            RegexTokenGenerator(string: "]").map(to: .closeSquareBracket),
            RegexTokenGenerator(string: ",").map(to: .comma),
            RegexTokenGenerator(string: ":").map(to: .colon),
            RegexTokenGenerator(word: "null").map(to: .null),
            RegexTokenGenerator(word: "true").map(to: .true),
            RegexTokenGenerator(word: "false").map(to: .false),

            WhiteSpaceTokenGenerator().ignore(),
        ]
    }

}
