//
//  ViewController.swift
//  Ogma
//
//  Created by mathiasquintero on 04/23/2019.
//  Copyright (c) 2019 mathiasquintero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    var timer: Timer?
    var defaultAttributes: [NSAttributedString.Key : Any]?

    deinit {
        timer?.invalidate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self

        defaultAttributes = textView.typingAttributes
        evaluateInput()
    }

}

extension ViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { [unowned self] _ in
            self.evaluateInput()
        }
    }

    func textView(_ textView: UITextView,
                  shouldInteractWith url: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {

        guard let json = textView
            .attributedText
            .attribute(.annotationValue,
                       at: characterRange.location,
                       effectiveRange: nil) as? JSON else { return true }

        present(json: json)
        return false
    }

}

extension ViewController {

    private func evaluateInput() {
        guard let input = textView.text else { return }
        let selectedRange = textView.selectedRange

        let string = try! JSON
            .annotate(input, using: JSON.Lexer.self)
            .string(attributes: defaultAttributes) { json in
                return [
                    .link: URL(string: "json://")!,
                ]
            }

        textView.attributedText = string
        textView.selectedRange = selectedRange
    }

}
