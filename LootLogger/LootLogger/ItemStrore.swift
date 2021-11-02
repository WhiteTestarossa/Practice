//
//  ItemStrore.swift
//  LootLogger
//
//  Created by Daniel Belokursky on 28.10.21.
//

import UIKit

class ItemStore {
    //MARK: - Public Properties
    var allItems = [Item]()
    
    //MARK: - Initializers
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    //MARK: - Methods
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
}