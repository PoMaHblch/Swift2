//
//  NewsCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 23.04.2022.
//

import UIKit

class NewsCell: UICollectionViewCell {
 
    

    @IBOutlet weak var like: LikeConrol!
    @IBOutlet var fotoNews: UIImageView!
    @IBOutlet var container: UIView!

    
        override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        container.addGestureRecognizer(tap)
    }
    @objc func handleTap(_: UITapGestureRecognizer) {
        like.isLike.toggle()
        
        if like.isLike {
            like.YeS.image = UIImage(systemName: "hand.thumbsup.fill")
        }else {
            like.YeS.image = UIImage(systemName: "hand.thumbsup")
        }
    }
    
}
