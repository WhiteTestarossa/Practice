//
//  DetailViewController.swift
//  LootLogger
//
//  Created by Daniel Belokursky on 1.11.21.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
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
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    //MARK: - Lifecycle
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
        valueTextField.keyboardType = .numberPad
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
        
        nameTextField.delegate = self
        serialTextField.delegate = self
        valueTextField.delegate = self
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backGroundTapped(_:)))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameTextField.text = item.name
        serialTextField.text = item.serialNumber
        valueTextField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateCreatedLabel.text = dateFormatter.string(from: item.dateCreated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        item.name = nameTextField.text ?? "Empty"
        item.serialNumber = serialTextField.text
        if let valueText = valueTextField.text, let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
        view.endEditing(true)
    }
    
    //MARK: - Actions
    @objc func backGroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: - TextField Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
