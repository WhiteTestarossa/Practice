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
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ItemCell.self, forCellReuseIdentifier: self.cellID)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 65
        self.navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem(_:)))
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    //MARK: - ViewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    //MARK: - Actions
    @objc func addNewItem(_ sender: UIBarButtonItem) {
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - Data Source Methods
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
                //MARK: Removing rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
                //MARK: Moving rows
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    //MARK: - Delegate Methods
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let item = itemStore.allItems[row]
            let detailViewController = DetailViewController()
            detailViewController.view.backgroundColor = .white
            detailViewController.item = item
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
