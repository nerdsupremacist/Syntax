//
//  Lexer.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

enum Lexer: GeneratorLexer {
    typealias Token = Ogma_Example.Token
    typealias Generator = AnyTokenGenerator<Token>

    static let generator: Generator = {
        return [
            Token.supportWhiteSpaces,
            Token.openCurlyBracket.generator(with: "\\{"),
            Token.closeCurlyBracket.generator(with: "\\}"),
            Token.openSquareBracket.generator(with: "\\["),
            Token.closeSquareBracket.generator(with: "\\]"),
            Token.comma.generator(with: ","),
            Token.colon.generator(with: ":"),
            Token.true.generator(with: "true"),
            Token.false.generator(with: "false"),
            Token.null.generator(with: "null"),
            String.generator(delimiter: "\"").map(Token.string),
            Int.generator.map(Token.int),
            Double.generator.map(Token.double),
        ].any()
    }()
}
