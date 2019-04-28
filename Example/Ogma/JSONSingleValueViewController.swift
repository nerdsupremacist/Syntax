//
//  JSONSingleValueViewController.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/29/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class JSONSingleValueViewController: UIViewController {

    let json: JSON

    init(json: JSON) {
        self.json = json
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let textLabel = UILabel()
        textLabel.text = json.valueDescription

        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(textLabel)
        textLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        textLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -20)
        view.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor).isActive = true
    }

}
