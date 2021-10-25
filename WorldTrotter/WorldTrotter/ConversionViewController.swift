//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Daniel Belokursky on 24.10.21.
//

import UIKit

class ConversionViewController: UIViewController {
    //MARK: - Public Properties
    var fahrenheitNumberLabel: UILabel!
    var dgsFahrenheitLabel: UILabel!
    var isRlyLabel: UILabel!
    var celciusNumberLabel: UILabel!
    var dgsCelciusLabel: UILabel!
    
    // MARK: - LoadView()
    override func loadView() {
        let backgroundView = UIView()
        self.view = backgroundView
        self.view.backgroundColor = UIColor(red: CGFloat(245)/255, green: CGFloat(244)/255, blue: CGFloat(241)/255, alpha: 1.0)
        let labelsColor = UIColor(red: CGFloat(225)/255, green: CGFloat(88)/255, blue: CGFloat(41)/255, alpha: 1.0)
        
        fahrenheitNumberLabel = UILabel()
        fahrenheitNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fahrenheitNumberLabel)
        fahrenheitNumberLabel.text = "212"
        fahrenheitNumberLabel.textColor = labelsColor
        fahrenheitNumberLabel.font = .systemFont(ofSize: CGFloat(70))
        
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
        
        NSLayoutConstraint.activate([
            fahrenheitNumberLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            fahrenheitNumberLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            dgsFahrenheitLabel.topAnchor.constraint(equalTo: fahrenheitNumberLabel.bottomAnchor, constant: 8.0),
            dgsFahrenheitLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberLabel.centerXAnchor),
            isRlyLabel.topAnchor.constraint(equalTo: dgsFahrenheitLabel.bottomAnchor, constant: 8.0),
            isRlyLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberLabel.centerXAnchor),
            celciusNumberLabel.topAnchor.constraint(equalTo: isRlyLabel.bottomAnchor, constant: 8.0),
            celciusNumberLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberLabel.centerXAnchor),
            dgsCelciusLabel.topAnchor.constraint(equalTo: celciusNumberLabel.bottomAnchor, constant: 8.0),
            dgsCelciusLabel.centerXAnchor.constraint(equalTo: fahrenheitNumberLabel.centerXAnchor)
        ])
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

