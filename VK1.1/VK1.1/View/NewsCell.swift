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
    @IBOutlet var animationLike: UIView!
    @IBOutlet weak var likeText: UILabel!
    @IBOutlet var eyeText: UILabel!
    @IBOutlet var EyE: EyeControl!
   
    
    var likes = 0 {
        didSet{
        likeText.text = "\(likes)"
        }
    }
    
    var eyes = 15 {
        didSet{
            eyeText.text = "\(eyes)"
        }
    }

   override func awakeFromNib() {
       let tap = UITapGestureRecognizer(target: self, action: #selector(click(_:)))
       tap.numberOfTapsRequired = 1
       like.addGestureRecognizer(tap)
       
       let tapp = UITapGestureRecognizer(target: self, action: #selector(eyeclick(_:)))
       tapp.numberOfTapsRequired = 1
       EyE.addGestureRecognizer(tapp)
       
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
                         initialSpringVelocity: 4,
                         options: .curveEaseInOut) {
            self.likeText.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
          }
        likeText.transform = .identity
    }
    
override func layoutSubviews() {
    super.layoutSubviews()
    animationLike.layer.cornerRadius = bounds.height/1.2
   }
    @objc func eyeclick(_: UITapGestureRecognizer) {
        
        EyE.isEYE.toggle()
        
        if EyE.isEYE {
            EyE.eyeImage.image = UIImage(systemName: "eye.fill")
            eyes += 1
        }else{
            EyE.eyeImage.image = UIImage(systemName: "eye")
            eyes -= 1
        }
        UIView.animate(withDuration: 1,
                            delay: 0.1,
                             usingSpringWithDamping: 0.15,
                             initialSpringVelocity: 4,
                             options: .curveEaseInOut) {
            self.eyeText.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
              }
            eyeText.transform = .identity
    }
}
