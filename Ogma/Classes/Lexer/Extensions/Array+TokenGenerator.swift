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
    
    public func take(text: String) throws -> Generated<Token> {
        var errors: [LexerError] = []

        for generator in self {
            do {
                return try generator.take(text: text)
            } catch let error as LexerError {
                errors.append(error)
            } catch {
                errors.append(.unknown(error))
            }
        }

        throw LexerError.noGeneratorMatched(text, errors: errors)
    }
    
}
