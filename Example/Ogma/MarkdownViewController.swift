//
//  MarkdownViewController.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 8/12/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

import UIKit
import Ogma

class MarkdownViewController: UIViewController {
    @IBOutlet weak var textView: EditorTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.editorDelegate = self
    }
}

extension MarkdownViewController: UITextViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }

}

extension MarkdownViewController: AttributesAndAttachmentsEditorDelegate {
    typealias Value = Markdown
    typealias Lexer = Markdown.Lexer

    var linkTextAttributes: [NSAttributedString.Key : Any]? {
        return [:]
    }

    func attributes(for value: Markdown, token: Markdown) -> [NSAttributedString.Key : Any] {
        switch value {
        case .bold:
            return [
                .font: font
            ]
        case .italic:
            return [
                .font: font
            ]
        case .scratch:
            return [
                .font: font
            ]
        case .snippet:
            return [
                .font: font
            ]
        case .link(let link):
            return [
                .link: link.url,
            ]
        case .image(let image):
            return [
                .font: font
            ]

        case .header(let header):
            return [
                .font: font
            ]
        }
    }

    func attachments(for value: Markdown, token: Markdown) -> [NSTextAttachment] {
        switch value {
        case .image(let image):
            guard let image = UIImage(named: image.identifier) else {
                return []
            }

            return [ImageAttachment.with(image: image)]
        default:
            return []
        }
    }

    func didTap(value: Markdown, token: Markdown, rect: CGRect) {
        //
    }

}

private let font = UIFont(name: "Menlo-Regular", size: 14.0)!

class ImageAttachment: NSTextAttachment {

    static func with(image: UIImage) -> NSTextAttachment {
        let attachment = ImageAttachment()
        attachment.image = image
        return attachment
    }

    override func attachmentBounds(for textContainer: NSTextContainer?,
                                   proposedLineFragment lineFrag: CGRect,
                                   glyphPosition position: CGPoint,
                                   characterIndex charIndex: Int) -> CGRect {

        guard let image = image else { return .zero }

        let size = image.size
        let aspectRatio = size.height / size.width
        let newHeight = (lineFrag.width - 16) * aspectRatio

        return CGRect(x: lineFrag.origin.x + 8,
                      y: lineFrag.origin.y + 8,
                      width: lineFrag.width - 16,
                      height: newHeight)
    }

}
