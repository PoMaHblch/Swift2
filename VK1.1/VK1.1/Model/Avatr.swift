//
//  Avatr.swift
//  VK1.1
//
//  Created by Роман Турьянов on 16.04.2022.
//

import UIKit

class Avatr: UIView {

  
    @IBOutlet weak var AvatarImage: UIImageView!
    @IBOutlet weak var shadowAvatr: UIView!
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
        shadowAvatr.layer.shadowColor = shadowColor.cgColor
        shadowAvatr.layer.shadowOffset = .zero
        shadowAvatr.layer.shadowRadius = 5
        shadowAvatr.layer.shadowOpacity = 0.7
        
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowAvatr.layer.cornerRadius = bounds.height/2
        AvatarImage.layer.cornerRadius = bounds.height/2
        
        
    }
}
