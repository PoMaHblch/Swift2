//
//  CollectionCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.04.2022.
//

import UIKit


class CollectionCell: UICollectionViewCell {
    
 
    @IBOutlet var likeTag: UILabel!
    @IBOutlet var likeControle: LikeController!
    @IBOutlet weak var FotoCell: UIImageView!
    @IBOutlet var containerView: UIView!
    
    var click = 0 {
        didSet{
            likeTag.text = "\(click)"
        }
    }
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 1
        likeControle.addGestureRecognizer(tap)
    }
    
    

   
   @objc func handleTap(_: UITapGestureRecognizer) {
       likeControle.isLike.toggle()
  
       if likeControle.isLike {
           likeControle.likePicture.image = UIImage(systemName: "suit.heart.fill")
           click += 1
       } else {
           likeControle.likePicture.image = UIImage(systemName: "suit.heart")
           click -= 1
       }
   }
}
