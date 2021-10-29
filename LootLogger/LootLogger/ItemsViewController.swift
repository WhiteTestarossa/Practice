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
        self.tableView.register(ItemCell.self, forCellReuseIdentifier: self.cellID)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 65
    }
    
    //MARK: - Actions //TODO
    @objc func addNewItem(_ sender: UIButton) {
        
    }
    
    @objc func toggleEdittingMode(_ sender: UIButton) {
        
    }
    //MARK: Data Source Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! ItemCell
        let item = itemStore.allItems[indexPath.row]
        cell.nameLabel.text = item.name
        cell.valueLabel.text = "$\(String(item.valueInDollars))"
        cell.serialNumberLabel.text = item.serialNumber
        return cell
    }
}
