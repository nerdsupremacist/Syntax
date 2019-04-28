//
//  JSONValueTableViewCell.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/28/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class JSONDictionaryValueTableViewCell: UITableViewCell {
    var name: String! {
        didSet {
            textLabel?.text = name
        }
    }

    var json: JSON! {
        didSet {
            detailTextLabel?.text = json.valueDescription
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

