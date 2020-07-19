//
//  EditorDelegateProtocol.swift
//  Ogma
//
//  Created by Mathias Quintero on 8/14/19.
//

#if os(iOS)
import Foundation
import UIKit

public protocol EditorDelegateProtocol: class {
    var linkTextAttributes: [NSAttributedString.Key : Any]? { get }

    func string(for input: String, defaultAttributes: [NSAttributedString.Key : Any]) throws -> NSAttributedString
    func attemptToHandleTap(url: URL, value: Any, token: Any, rect: CGRect) -> Bool
}
#endif
