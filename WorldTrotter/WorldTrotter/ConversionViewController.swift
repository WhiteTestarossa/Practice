//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Daniel Belokursky on 24.10.21.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    //MARK: - Public Properties
    var fahrenheitNumberTextField: UITextField!
    var dgsFahrenheitLabel: UILabel!
    var isRlyLabel: UILabel!
    var celciusNumberLabel: UILabel!
    var dgsCelciusLabel: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelciusLabel()
        }
    }
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: CGFloat(245)/255, green: CGFloat(244)/255, blue: CGFloat(241)/255, alpha: 1.0)
        let labelsColor = UIColor(red: CGFloat(225)/255, green: CGFloat(88)/255, blue: CGFloat(41)/255, alpha: 1.0)
        
        //MARK: TextFields and Labels
        fahrenheitNumberTextField = UITextField()
        fahrenheitNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fahrenheitNumberTextField)
        fahrenheitNumberTextField.placeholder = "Value"
        fahrenheitNumberTextField.textColor = labelsColor
        fahrenheitNumberTextField.font = .systemFont(ofSize: CGFloat(70))
        fahrenheitNumberTextField.textAlignment = .center
        fahrenheitNumberTextField.borderStyle = .none
        fahrenheitNumberTextField.adjustsFontSizeToFitWidth = false
        fahrenheitNumberTextField.minimumFontSize = 17
        fahrenheitNumberTextField.keyboardType = .decimalPad
        fahrenheitNumberTextField.autocorrectionType = .no
        fahrenheitNumberTextField.spellCheckingType = .no
        fahrenheitNumberTextField.addTarget(self, action: #selector(fahrenheitTextFieldEditingChanged(_:)), for: .editingChanged)
        fahrenheitNumberTextField.delegate = self
        
        dgsFahrenheitLabel = UILabel()
        dgsFahrenheitLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dgsFahrenheitLabel)
        dgsFahrenheitLabel.text = "degrees Fahrenheit"
        dgsFahrenheitLabel.textColor = labelsColor
        dgsFahrenheitLabel.font = .systemFont(ofSize: CGFloat(36))
        
        isRlyLabel = UILabel()
        isRlyLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(isRlyLabel)
        isRlyLabel.text = "is really"
        isRlyLabel.font = .systemFont(ofSize: CGFloat(36))
        
        celciusNumberLabel = UILabel()
        celciusNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(celciusNumberLabel)
        celciusNumberLabel.text = "100"
        celciusNumberLabel.textColor = labelsColor
        celciusNumberLabel.font = .systemFont(ofSize: CGFloat(70))
        
        dgsCelciusLabel = UILabel()
        dgsCelciusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dgsCelciusLabel)
        dgsCelciusLabel.text = "degrees Celcius"
        dgsCelciusLabel.textColor = labelsColor
        dgsCelciusLabel.font = .systemFont(ofSize: CGFloat(36))
        
        //MARK: Constraints
        NSLayoutConstraint.activate([
            fahrenheitNumberTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            fahrenheitNumberTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            dgsFahrenheitLabel.topAnchor.constraint(equalTo: fahrenheitNumberTextField.bottomAnchor, constant: 8.0),
            dgsFahrenheitLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberTextField.centerXAnchor),
            isRlyLabel.topAnchor.constraint(equalTo: dgsFahrenheitLabel.bottomAnchor, constant: 8.0),
            isRlyLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberTextField.centerXAnchor),
            celciusNumberLabel.topAnchor.constraint(equalTo: isRlyLabel.bottomAnchor, constant: 8.0),
            celciusNumberLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberTextField.centerXAnchor),
            dgsCelciusLabel.topAnchor.constraint(equalTo: celciusNumberLabel.bottomAnchor, constant: 8.0),
            dgsCelciusLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberTextField.centerXAnchor)
        ])
        
        //MARK: GestureRecognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        updateCelciusLabel()
    }
    
    //MARK: - Actions
    @objc func fahrenheitTextFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitNumberTextField.resignFirstResponder()
    }
    
    //MARK: - Methods
    func updateCelciusLabel() {
        if let celciusValue = celciusValue {
            celciusNumberLabel.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        } else {
            celciusNumberLabel.text = "?"
        }
    }
    
    //MARK: - TextField Delegate Methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    
}

