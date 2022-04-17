//
//  LikeController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 16.04.2022.
//

import UIKit

class LikeController: UIControl {
    
    @IBOutlet var likePicture: UIImageView!
    
    var isLike: Bool = false
    
    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .red
    }
    
   

}
