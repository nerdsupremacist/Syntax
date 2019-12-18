//
//  AttributesEditorDelegate.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/14/19.
//

#if os(iOS)
import Foundation

public protocol AttributesEditorDelegate: EditorDelegate {
    func attributes(for value: Value, token: Value.Token) -> [NSAttributedString.Key : Any]
}

extension AttributesEditorDelegate {

    public func string(text: String, value: Value, token: Value.Token) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: attributes(for: value, token: token))
    }

}
#endif
