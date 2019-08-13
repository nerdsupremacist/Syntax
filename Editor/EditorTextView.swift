//
//  EditorTextView.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/10/19.
//

import UIKit

private let parsedURL = URL(string: "parsed://")!

@objc
@IBDesignable
open class EditorTextView: UITextView {
    public weak var editorDelegate: EditorDelegateProtocol? {
        didSet {
            linkTextAttributes = editorDelegate?.linkTextAttributes ?? linkTextAttributes
            evaluateInput()
        }
    }

    open override var delegate: UITextViewDelegate? {
        get {
            return delegator
        }
        set {
            delegator.delegate = newValue
            super.delegate = delegator
        }
    }

    private lazy var delegator: DelegateDelegator = DelegateDelegator(editor: self)
    private var timer: Timer?
    private lazy var defaultAttributes: [NSAttributedString.Key : Any] = {
        return typingAttributes
    }()

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        delegator.delegate = super.delegate
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegator.delegate = super.delegate
    }

    deinit {
        timer?.invalidate()
    }

    fileprivate func didChange() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [unowned self] _ in self.evaluateInput() }
    }

    fileprivate func shouldInteractWith(url: URL,
                                        in characterRange: NSRange) -> Bool {

        guard let editorDelegate = editorDelegate else { return true }

        guard let value = attributedText
            .attribute(.annotationValue,
                       at: characterRange.location,
                       effectiveRange: nil) else { return true }

        guard let token = attributedText
            .attribute(.annotationToken,
                       at: characterRange.location,
                       effectiveRange: nil) else { return true }

        return !editorDelegate.attemptToHandleTap(url: url,
                                                  value: value,
                                                  token: token,
                                                  rect: rect(for: characterRange) ?? .zero)
    }
}

extension EditorTextView {

    private func evaluateInput() {
        guard let input = text else { return }
        let selectedRange = self.selectedRange

        do {
            let string = try editorDelegate?.string(for: input, defaultAttributes: defaultAttributes)
            if let string = string {
                attributedText = string
            }
        } catch {
            attributedText = NSAttributedString(string: input, attributes: defaultAttributes)
        }

        self.selectedRange = selectedRange
    }

}

extension UITextView {

    fileprivate func rect(for range: NSRange) -> CGRect? {
        guard let start = position(from: beginningOfDocument, offset: range.location),
            let end = position(from: start, offset: range.length),
            let range = textRange(from: start, to: end) else { return nil }

        return firstRect(for: range)
    }

}

private class DelegateDelegator: NSObject, UITextViewDelegate {
    unowned let editor: EditorTextView
    weak var delegate: UITextViewDelegate?

    init(editor: EditorTextView) {
        self.editor = editor
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll?(scrollView)
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidZoom?(scrollView)
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegate?.scrollViewWillBeginDragging?(scrollView)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegate?.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        delegate?.scrollViewWillBeginDecelerating?(scrollView)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndDecelerating?(scrollView)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndScrollingAnimation?(scrollView)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return delegate?.viewForZooming?(in: scrollView)
    }

    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        delegate?.scrollViewWillBeginZooming?(scrollView, with: view)
    }

    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        delegate?.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale)
    }

    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return delegate?.scrollViewShouldScrollToTop?(scrollView) ?? true
    }

    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScrollToTop?(scrollView)
    }

    @available(iOS 11.0, *)
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidChangeAdjustedContentInset?(scrollView)
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return delegate?.textViewShouldBeginEditing?(textView) ?? true
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return delegate?.textViewShouldEndEditing?(textView) ?? true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        delegate?.textViewDidBeginEditing?(textView)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        delegate?.textViewDidEndEditing?(textView)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return delegate?.textView?(textView, shouldChangeTextIn: range, replacementText: text) ?? true
    }

    func textViewDidChange(_ textView: UITextView) {
        editor.didChange()
        delegate?.textViewDidChange?(textView)
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.textViewDidChangeSelection?(textView)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if editor.shouldInteractWith(url: URL, in: characterRange) {
            return delegate?.textView?(textView, shouldInteractWith: URL, in: characterRange, interaction: interaction) ?? true
        }
        return false
    }

    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return delegate?.textView?(textView, shouldInteractWith: textAttachment, in: characterRange, interaction: interaction) ?? true
    }
}
