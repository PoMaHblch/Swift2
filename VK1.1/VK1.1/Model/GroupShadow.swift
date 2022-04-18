//
//  GroupShawdou.swift
//  VK1.1
//
//  Created by Роман Турьянов on 18.04.2022.
//

import UIKit

class GroupShadow: UIView {


    @IBOutlet var shadowGroup: UIView!
    
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
        shadowGroup.layer.shadowColor = shadowColor.cgColor
        shadowGroup.layer.shadowOffset = .zero
        shadowGroup.layer.shadowRadius = 5
        shadowGroup.layer.shadowOpacity = 0.7
        
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowGroup.layer.cornerRadius = bounds.height/2
        
        
        
    }
}
