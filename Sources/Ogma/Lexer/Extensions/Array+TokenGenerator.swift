//
//  Array+TokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Array: TokenGenerator where Element: TokenGenerator {

    public typealias Token = Element.Token
    
    public func take(text: String) throws -> TokenResult<Element.Token> {
        var results: [TokenResult<Element.Token>] = []
        var errors: [LexerError] = []

        for generator in self {
            do {
                results.append(try generator.take(text: text))
            } catch let error as LexerError {
                errors.append(error)
            } catch {
                errors.append(.custom(error))
            }
        }

        let sortedResults = results.sorted { $0.remainingString?.count ?? 0 < $1.remainingString?.count ?? 0 }
        guard let result = sortedResults.first else {
            throw LexerError.noGeneratorMatched(text, errors: errors)
        }

        return result
    }

    public func annotate(text: String) throws -> [AnnotationElement<Element.Token?>] {
        return try reduce([.text(text)]) { try $1.annotate($0) }
    }
    
}
