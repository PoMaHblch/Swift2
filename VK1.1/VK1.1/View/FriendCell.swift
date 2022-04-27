//
//  FriendCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 20.04.2022.
//

import UIKit

class FriendCell: UITableViewCell {
    
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet var animationFriend: UIView!
    @IBOutlet var shadowFriend: UIView!
    @IBOutlet weak var friendText: UILabel!
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowFriend.layer.shadowColor = shadowColor.cgColor
        shadowFriend.layer.shadowOffset = .zero
        shadowFriend.layer.shadowRadius = 4
        shadowFriend.layer.shadowOpacity = 0.6
       
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowFriend.layer.cornerRadius = bounds.height/2.3
        friendImage.layer.cornerRadius = bounds.height/2.5
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tapp(_ sender: Any) {
    
    UIView.animate(withDuration: 1,
                        delay: 0.1,
                         usingSpringWithDamping: 0.15,
                         initialSpringVelocity: 10,
                         options: .curveEaseInOut) {
            self.animationFriend.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
          }
        animationFriend.transform = .identity
    }

}
