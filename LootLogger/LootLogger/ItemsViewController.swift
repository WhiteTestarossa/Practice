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
    }
    
    //MARK: - Actions
    @objc func addNewItem(_ sender: UIButton) {
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @objc func toggleEdittingMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("EDIT", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("DONE", for: .normal)
            setEditing(true, animated: true )
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
    //MARK: Header with 2 buttons
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerTableView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        
        let editButton = UIButton()
        let addButton = UIButton()
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        editButton.setTitleColor(.blue, for: .normal)
        editButton.setTitle("EDIT", for: UIControl.State.normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.setTitle("ADD", for: UIControl.State.normal)
        
        editButton.addTarget(self, action: #selector(toggleEdittingMode(_:)), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(addNewItem(_:)), for: .touchUpInside)
        
        headerTableView.addSubview(editButton)
        headerTableView.addSubview(addButton)
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editButton.centerYAnchor.constraint(equalTo: headerTableView.centerYAnchor),
            editButton.leadingAnchor.constraint(equalTo: headerTableView.leadingAnchor, constant: 8.0),
            editButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -8.0),
            addButton.centerYAnchor.constraint(equalTo: headerTableView.centerYAnchor),
            addButton.leadingAnchor.constraint(equalTo: editButton.trailingAnchor, constant: 8.0),
            addButton.trailingAnchor.constraint(equalTo: headerTableView.trailingAnchor, constant: -8.0),
            editButton.widthAnchor.constraint(equalTo: addButton.widthAnchor)
        ])
        
        return headerTableView
    }
}
