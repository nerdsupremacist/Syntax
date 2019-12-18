//
//  EditorDelegate.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/14/19.
//

#if os(iOS)
import Foundation

private let parsedURL = URL(string: "parsed://")!

public protocol EditorDelegate: EditorDelegateProtocol {
    associatedtype Value: Parsable
    associatedtype Lexer: LexerProtocol where Lexer.Token == Value.Token

    func string(text: String, value: Value, token: Value.Token) -> NSAttributedString
    func didTap(value: Value, token: Value.Token, rect: CGRect)
}

extension EditorDelegate {
    public var linkTextAttributes: [NSAttributedString.Key : Any]? {
        return nil
    }

    public func string(for input: String,
                       defaultAttributes: [NSAttributedString.Key : Any]) throws -> NSAttributedString {
        
        return try Value
            .detailedAnnotation(input, using: Lexer.self)
            .string(attributes: defaultAttributes) { text, value, token -> NSAttributedString in
                return string(text: text, value: value, token: token).with(attributes: [.link : parsedURL])
            }
    }

    public func attemptToHandleTap(url: URL, value: Any, token: Any, rect: CGRect) -> Bool {
        guard url == parsedURL else { return false }
        didTap(value: value as! Value, token: token as! Value.Token, rect: rect)
        return true
    }
}
#endif
