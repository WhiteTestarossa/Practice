//
//  ViewController.swift
//  Photorama
//
//  Created by Daniel Belokursky on 18.11.21.
//

import UIKit

class PhotosViewController: UIViewController,UICollectionViewDelegate {
    
    //MARK: - Public Properties
    var collectionView: UICollectionView!
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Photorama"
        photosCollectionView()
        store.fetchInterestingPhotos { (photosResult) in
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    //MARK: - Collection View
    func photosCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset.left = 2
        layout.sectionInset.top = 2
        layout.sectionInset.right = 2
        layout.sectionInset.bottom = 2
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        store.fetchImage(for: photo) { result in
            guard let photoIndex = self.photoDataSource.photos.firstIndex(of: photo), case let .success(image) = result else {
                return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                cell.update(displaying: image)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoInfoVC = PhotoInfoViewController()
        let photo = photoDataSource.photos[indexPath.row]
        photoInfoVC.photo = photo
        photoInfoVC.store = store
        navigationController?.pushViewController(photoInfoVC, animated: true)
    }
    
}

