//
//  PhotoController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.05.2022.
//

import UIKit

class PhotoController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var CollectionView: UICollectionView!
    
    var arrayFriend: photoGallery!
    let countCells = 1
    let indentifire = "PhotoView"
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.collectionViewLayout = CollectionViewFlowLayout(itemSize: CollectionPhotoCell.cellSize);
        CollectionView.decelerationRate = UIScrollView.DecelerationRate.fast

        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.register(UINib(nibName: "CollectionPhotoCell", bundle: nil), forCellWithReuseIdentifier: indentifire)
        
        CollectionView.performBatchUpdates(nil) { (result) in
            self.CollectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
   
    }
  
}
extension PhotoController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFriend.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifire, for: indexPath) as? CollectionPhotoCell else {
            preconditionFailure("Error")
        }
        cell.photoView.image = arrayFriend.images[indexPath.item]
        return cell
    }
 
}
