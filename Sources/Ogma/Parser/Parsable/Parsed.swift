//
//  Parsed.swift
//  
//
//  Created by Mathias Quintero on 12/18/19.
//

import Foundation

@propertyWrapper
struct Parsed<Lexer: LexerProtocol, Value: Parsable>: Codable where Lexer.Token == Value.Token {
    private let stringRepresentation: String
    var wrappedValue: Value

    private init(stringRepresentation: String) throws {
        self.stringRepresentation = stringRepresentation
        self.wrappedValue = try Value.parse(stringRepresentation, using: Lexer.self)
    }

    init(from decoder: Decoder) throws {
        try self.init(stringRepresentation: try decoder.singleValueContainer().decode(String.self))
    }

    func encode(to encoder: Encoder) throws {
        try stringRepresentation.encode(to: encoder)
    }
}
