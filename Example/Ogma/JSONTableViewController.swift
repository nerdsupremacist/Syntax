//
//  JSONTableViewController.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/28/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class JSONObjectTableViewController: UITableViewController {
    let values: [(key: String, value: JSON)]

    init(json: [String : JSON]) {
        self.values = json.map { $0 }
        super.init(style: .grouped)
        title = "Object"
    }

    init(json: [JSON]) {
        self.values = json.enumerated().map { (String($0), $1) }
        super.init(style: .grouped)
        title = "Array"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "json")
            ?? JSONDictionaryValueTableViewCell(style: .value1, reuseIdentifier: "json")

        if let cell = cell as? JSONDictionaryValueTableViewCell {
            cell.name = values[indexPath.row].key
            cell.json = values[indexPath.row].value
        }

        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let rect = cell.convert(cell.bounds, to: tableView)

        present(json: values[indexPath.row].value, rect: rect)
    }

}
