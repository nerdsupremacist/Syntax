//
//  Keyword.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/12/19.
//

import Foundation

public protocol LanguageKeyword: TokenProtocol, CaseIterable {
    var word: String { get }
}

public struct KeywordTokenGenerator<Token: LanguageKeyword>: TokenGenerator {
    private let generators: [AnyTokenGenerator<Token>]

    public init() {
        generators = Token.allCases.map { RegexTokenGenerator(word: $0.word).map(to: $0) }
    }

    public func take(text: String) throws -> TokenResult<Token> {
        return try generators.take(text: text)
    }

    public func annotate(text: String) throws -> [AnnotationElement<Token?>] {
        return try generators.annotate(text: text)
    }
}
