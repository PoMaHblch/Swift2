//
//  ListXIBTableViewCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 20.04.2022.
//

import UIKit

class ListXIBTableViewCell: UITableViewCell {


    @IBOutlet var animationXIB: UIView!
    @IBOutlet var listImageView: UIImageView!
    @IBOutlet var listNameLabel: UILabel!
    @IBOutlet var listShadow: UIView!
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
        listShadow.layer.shadowColor = shadowColor.cgColor
        listShadow.layer.shadowOffset = .zero
        listShadow.layer.shadowRadius = 4
        listShadow.layer.shadowOpacity = 0.8
        
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        listShadow.layer.cornerRadius = bounds.height/2.5
        listImageView.layer.cornerRadius = bounds.height/2.5
        
        
    }
   @IBAction func click(_ sender: Any) {


   UIView.animate(withDuration: 1,
                       delay: 0.1,
                        usingSpringWithDamping: 0.15,
                        initialSpringVelocity: 5,
                        options: .curveEaseInOut) {
           self.animationXIB.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
         }
       animationXIB.transform = .identity
   }
  
}

