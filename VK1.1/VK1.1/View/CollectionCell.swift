//
//  CollectionCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.04.2022.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    
 
    @IBOutlet var likeControle: LikeController!
    @IBOutlet weak var FotoCell: UIImageView!
    @IBOutlet var containerView: UIView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        containerView.addGestureRecognizer(tap)
    }
    @objc func handleTap(_: UITapGestureRecognizer) {
        likeControle.isLike.toggle()
        
        if likeControle.isLike {
            likeControle.likePicture.image = UIImage(systemName: "suit.heart.fill")
        }else {
            likeControle.likePicture.image = UIImage(systemName: "suit.heart")
        }
    }
}
