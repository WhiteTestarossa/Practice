//
//  LootCell.swift
//  LootLogger
//
//  Created by Daniel Belokursky on 29.10.21.
//

import UIKit

class ItemCell: UITableViewCell {
    //MARK: - Public Properties
    let nameLabel = UILabel()
    let serialNumberLabel = UILabel()
    let valueLabel = UILabel()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.numberOfLines = 0
        nameLabel.backgroundColor = .lightGray
        nameLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal) //fixes that editing mode dumb bug
        serialNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        serialNumberLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        serialNumberLabel.textColor = .secondaryLabel
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.preferredFont(forTextStyle: .body)
        valueLabel.backgroundColor = .lightGray
        valueLabel.adjustsFontForContentSizeCategory = true
        
        
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(serialNumberLabel)
        self.contentView.addSubview(valueLabel)
        
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.valueLabel.leadingAnchor, constant: -40.0),
            serialNumberLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            serialNumberLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            serialNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.nameLabel.bottomAnchor, multiplier: 1.0)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
