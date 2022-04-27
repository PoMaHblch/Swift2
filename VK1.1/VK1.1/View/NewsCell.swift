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
    @IBOutlet var comment: UITextField!
    @IBOutlet var animationLike: UIView!
    @IBOutlet weak var likeText: UILabel!
    
    var likes = 0 {
        didSet{
            
        likeText.text = "\(likes)"
            
        }
    }

   override func awakeFromNib() {
       let tap = UITapGestureRecognizer(target: self, action: #selector(click(_:)))
       tap.numberOfTapsRequired = 1
       like.addGestureRecognizer(tap)
   }
    
    @objc func click(_: UITapGestureRecognizer) {
       
        like.isLike.toggle()
        
        if like.isLike {
            like.YeS.image = UIImage(systemName: "suit.heart.fill")
            likeText.textColor = .red
            likes += 1
          
        
        }else {
            like.YeS.image = UIImage(systemName: "heart")
            likeText.textColor = .gray
            likes -= 1
           
        }
    
    
    UIView.animate(withDuration: 1,
                        delay: 0.1,
                         usingSpringWithDamping: 0.15,
                         initialSpringVelocity: 10,
                         options: .curveEaseInOut) {
            self.likeText.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
          }
        likeText.transform = .identity
    }
    
override func layoutSubviews() {
    super.layoutSubviews()
    animationLike.layer.cornerRadius = bounds.height/1.2
   }
}
