//
//  ViewController.swift
//  Photorama
//
//  Created by Daniel Belokursky on 18.11.21.
//

import UIKit

class PhotosViewController: UIViewController {
    //MARK: - Public Properties
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Photorama"
    }

    //MARK: - Image View
    func photosImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

