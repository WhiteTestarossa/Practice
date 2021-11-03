//
//  DetailViewController.swift
//  LootLogger
//
//  Created by Daniel Belokursky on 1.11.21.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: - Public Properties
    var nameLabel: UILabel!
    var serialNumberLabel: UILabel!
    var valueLabel: UILabel!
    var dateCreatedLabel: UILabel!
    
    var nameTextField: UITextField!
    var nameStackView: UIStackView!
    
    var serialTextField: UITextField!
    var serialStackView: UIStackView!
    
    var valueTextField: UITextField!
    var valueStackView: UIStackView!
    
    var stackView: UIStackView!
    
    
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Name Label and TextField
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        nameLabel.text = "Name"
        nameTextField = UITextField()
        nameTextField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        //MARK: Name StackView
        nameStackView = UIStackView()
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.axis = .horizontal
        nameStackView.spacing = 8
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)


        
        //MARK: Serial Label and TextField
        serialNumberLabel = UILabel()
        serialNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        serialNumberLabel.text = "Serial"
        serialTextField = UITextField()
        serialTextField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        serialTextField.translatesAutoresizingMaskIntoConstraints = false
        serialTextField.borderStyle = .roundedRect
        //MARK: Serial StackView
        serialStackView = UIStackView()
        serialStackView.translatesAutoresizingMaskIntoConstraints = false
        serialStackView.axis = .horizontal
        serialStackView.spacing = 8
        serialStackView.addArrangedSubview(serialNumberLabel)
        serialStackView.addArrangedSubview(serialTextField)
        
        
        //MARK: Value Label and TextField
        valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.text = "Value"
        valueTextField = UITextField()
        valueTextField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        valueTextField.translatesAutoresizingMaskIntoConstraints = false
        valueTextField.borderStyle = .roundedRect
        //MARK: Value StackView
        valueStackView = UIStackView()
        valueStackView.translatesAutoresizingMaskIntoConstraints = false
        valueStackView.axis = .horizontal
        valueStackView.spacing = 8
        valueStackView.addArrangedSubview(valueLabel)
        valueStackView.addArrangedSubview(valueTextField)
        
        //MARK: Date Label
        dateCreatedLabel = UILabel()
        dateCreatedLabel.text = "DATE"
        dateCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        dateCreatedLabel.textAlignment = .center
        dateCreatedLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        //MARK: - Vetical StackView
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.addArrangedSubview(nameStackView)
        self.stackView.addArrangedSubview(serialStackView)
        self.stackView.addArrangedSubview(valueStackView)
        self.stackView.addArrangedSubview(dateCreatedLabel)
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: serialTextField.leadingAnchor),
            serialTextField.leadingAnchor.constraint(equalTo: valueTextField.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8.0)
        ])

      
    }
}
