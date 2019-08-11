//
//  ViewController.swift
//  Ogma
//
//  Created by mathiasquintero on 04/23/2019.
//  Copyright (c) 2019 mathiasquintero. All rights reserved.
//

import UIKit
import Ogma

class ViewController: UIViewController {
    @IBOutlet weak var textView: EditorTextView!

    var timer: Timer?
    var defaultAttributes: [NSAttributedString.Key : Any]?

    deinit {
        timer?.invalidate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.editorDelegate = self
    }
}

extension ViewController: UITextViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }

}

extension ViewController: EditorDelegate {
    typealias Value = JSON
    typealias Lexer = JSON.Lexer

    var linkTextAttributes: [NSAttributedString.Key : Any]? {
        return [:]
    }

    func attributes(for value: JSON, token: JSON.Token) -> [NSAttributedString.Key : Any] {
        return [
            .foregroundColor: token.color,
            .font: font,
        ]
    }

    func didTap(value: JSON, token: JSON.Token, rect: CGRect) {
        present(json: value, rect: textView.convert(rect, to: view))
    }
}

private let font = UIFont(name: "Menlo-Regular", size: 14.0)!
