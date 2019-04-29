//
//  ViewController+JSON.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/29/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

private let popOverDelegate = PopOverDelegate()

extension UIViewController {

    func present(json: JSON, rect: CGRect = .zero) {
        switch json {
        case .dictionary(let dictionary):
            let viewController = JSONObjectTableViewController(json: dictionary)
            viewController.title = json.typeTitle
            navigationController?.pushViewController(viewController, animated: true)
        case .array(let array):
            let viewController = JSONObjectTableViewController(json: array)
            viewController.title = json.typeTitle
            navigationController?.pushViewController(viewController, animated: true)
        default:
            let viewController = JSONSingleValueViewController(json: json)

            viewController.modalPresentationStyle = .popover
            viewController.title = json.typeTitle
            viewController.popoverPresentationController?.delegate = popOverDelegate
            viewController.popoverPresentationController?.sourceView = view
            viewController.popoverPresentationController?.sourceRect = rect
            viewController.popoverPresentationController?.permittedArrowDirections = .any

            present(viewController, animated: true)
        }


    }

}

private class PopOverDelegate: NSObject, UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

}
