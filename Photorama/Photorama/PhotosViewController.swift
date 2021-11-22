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
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Photorama"
        photosImageView()
        
        store.fetchInterestingPhotos {
            (photosResult) in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                
            }
        }
    }
    
    //MARK: - Image View
    func photosImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) { (imageResult) in
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }
}

