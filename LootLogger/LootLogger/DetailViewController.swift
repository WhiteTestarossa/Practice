//
//  DetailViewController.swift
//  LootLogger
//
//  Created by Daniel Belokursky on 1.11.21.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
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
    var toolBar: UIToolbar!
    var imageView: UIImageView!
    
    var imageStore: ImageStore!
    
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
        
        //MARK: - ToolBar
        toolBar = UIToolbar() // FIXME: CONSTRAINT BUG?
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        var toolBarItems = [UIBarButtonItem]()
        toolBarItems.append(UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(choosePhotoSource(_:))))
        toolBar.setItems(toolBarItems, animated: true)
        
        //MARK: - ImageView
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 248), for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        imageView.contentMode = .scaleAspectFit
        
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
        self.stackView.addArrangedSubview(imageView)
        self.view.addSubview(stackView)
        self.view.addSubview(toolBar)
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: serialTextField.leadingAnchor),
            serialTextField.leadingAnchor.constraint(equalTo: valueTextField.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
        ])
        
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            toolBar.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8.0),
        ])
        
        NSLayoutConstraint.activate([
            
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
        let key = item.itemKey
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
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
    @objc func choosePhotoSource(_ sender: UIBarButtonItem) {
        let allertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                let imagePicker = self.imagePicker(for: .camera)
                self.present(imagePicker, animated: true, completion: nil)
            }
            allertController.addAction(cameraAction)
        }
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
            let imagePicker = self.imagePicker(for: .photoLibrary)
            imagePicker.modalPresentationStyle = .popover
            imagePicker.popoverPresentationController?.barButtonItem = sender
            self.present(imagePicker, animated: true, completion: nil)
        }
        allertController.addAction(photoLibraryAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        allertController.addAction(cancelAction)
        present(allertController, animated: true, completion: nil)
    }
    
    //MARK: - TextField Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Additional Methods
    func imagePicker(for sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        return imagePicker
    }
    
    //MARK: - ImagePicker Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        imageStore.setImage(image, forKey: item.itemKey)
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
}
