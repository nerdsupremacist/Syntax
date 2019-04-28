//
//  ViewController+JSON.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/29/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension UIViewController {

    func present(json: JSON) {

        let viewController: UIViewController

        switch json {
        case .dictionary(let dictionary):
            viewController = JSONObjectTableViewController(json: dictionary)
        case .array(let array):
            viewController = JSONObjectTableViewController(json: array)
        default:
            viewController = JSONSingleValueViewController(json: json)
        }

        viewController.title = json.typeTitle

        navigationController?.pushViewController(viewController, animated: true)
    }

}
