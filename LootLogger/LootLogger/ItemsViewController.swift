//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Daniel Belokursky on 28.10.21.
//
import UIKit

class ItemsViewController: UITableViewController {
    //MARK: - Public Properties
    var itemStore: ItemStore!
    let cellID = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: Data Source Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
        }
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }
}
