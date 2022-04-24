//
//  FriendCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 20.04.2022.
//

import UIKit

class FriendCell: UITableViewCell {
    
    
    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
