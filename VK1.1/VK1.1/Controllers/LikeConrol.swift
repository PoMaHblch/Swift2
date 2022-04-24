//
//  LikeConrol.swift
//  VK1.1
//
//  Created by Роман Турьянов on 24.04.2022.
//

import UIKit

class LikeConrol: UIControl {

    @IBOutlet var YeS: UIImageView!
    
    var isLike: Bool = false
    
    override func awakeFromNib() {
        
        YeS.backgroundColor = .clear
        YeS.tintColor = .cyan
    }

}
