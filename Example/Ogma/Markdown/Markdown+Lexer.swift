//
//  Markdown+Lexer.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 8/11/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Ogma

extension Markdown {

    enum Lexer: GeneratorLexer {
        typealias Token = Markdown

        static let generators: Generators = [
            HeaderTokenGenerator().any(),
            ImageTokenGenrator().any(),
            LinkTokenGenrator().any(),

            StringLiteralTokenGenerator(delimiter: "`").map(Token.snippet),
            StringLiteralTokenGenerator(delimiter: "```", allowsMultiline: true).map(Token.snippet),

            StringLiteralTokenGenerator(delimiter: "\\*\\*").map(Token.bold),
            StringLiteralTokenGenerator(delimiter: "\\*").map(Token.italic),

            StringLiteralTokenGenerator(delimiter: "__").map(Token.bold),
            StringLiteralTokenGenerator(delimiter: "_").map(Token.italic),

            StringLiteralTokenGenerator(delimiter: "~~").map(Token.scratch),
        ]
    }

}

private struct HeaderTokenGenerator: RegexTokenGeneratorProtocol {
    typealias Token = Markdown

    let pattern = "(#{1,4})\\s+(\\S.+)"

    func token(from groups: MatchGroups) throws -> Markdown? {
        return .header(Markdown.Header(level: try groups.attempt(group: 1).count,
                                       text: try groups.attempt(group: 2)))
    }
}

private struct LinkTokenGenrator: RegexTokenGeneratorProtocol {
    typealias Token = Markdown

    let pattern = "\\[([^\\]]+)]\\(([^\\)]+)\\)"

    func token(from groups: MatchGroups) throws -> Markdown? {
        guard let url = URL(string: try groups.attempt(group: 2)) else { return nil }
        return .link(Markdown.Link(name: try groups.attempt(group: 1), url: url))
    }
}

private struct ImageTokenGenrator: RegexTokenGeneratorProtocol {
    typealias Token = Markdown

    let pattern = "!\\[([^\\]]+)]\\(([^\\)]+)\\)"

    func token(from groups: MatchGroups) throws -> Markdown? {
        return .image(Markdown.Image(name: try groups.attempt(group: 1),
                                     identifier: try groups.attempt(group: 2)))
    }
}

extension Markdown: Parsable {
    typealias Token = Markdown
    static let parser: AnyParser<Markdown, Markdown> = .consuming { $0 }
}
