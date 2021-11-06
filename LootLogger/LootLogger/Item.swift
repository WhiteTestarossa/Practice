//
//  Item.swift
//  LootLogger
//
//  Created by Daniel Belokursky on 28.10.21.
//

import UIKit

class Item: Equatable, Codable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name && lhs.valueInDollars == rhs.valueInDollars && lhs.serialNumber == rhs.serialNumber && lhs.dateCreated == rhs.dateCreated
    }
    
    //MARK: - Public Properties
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    var itemKey: String
    
    //MARK: - Initializers
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffyasdhfjshafjhsafhajsdlfjlksafjlsajfsdfhkj", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            let randomAdjective = adjectives.randomElement()!
            let randomNoun = nouns.randomElement()!
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int.random(in: 0..<100)
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        } else {
            self.init(name: "Empty", serialNumber: nil, valueInDollars: 0)
        }
    }
}
