//
//  AttributesAndAttachmentsEditorDelegate.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/14/19.
//

#if os(iOS)
import Foundation

public protocol AttributesAndAttachmentsEditorDelegate: EditorDelegate {
    func attachments(for value: Value, token: Value.Token) -> [NSTextAttachment]
    func attributes(for value: Value, token: Value.Token) -> [NSAttributedString.Key : Any]
}

extension AttributesAndAttachmentsEditorDelegate {

    public func string(text: String, value: Value, token: Value.Token) -> NSAttributedString {
        let attributes = NSAttributedString(string: text, attributes: self.attributes(for: value, token: token))
        let attachments: [NSAttributedString] = self.attachments(for: value, token: token).map { NSAttributedString(attachment: $0) }

        let all = [
            [attributes],
            attachments
        ]

        return all.flatMap { $0 }
            .reduce(into: NSMutableAttributedString()) { $0.append($1) }
    }

}
#endif
