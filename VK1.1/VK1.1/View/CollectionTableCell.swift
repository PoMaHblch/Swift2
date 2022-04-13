//
//  CollectionTableCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.04.2022.
//

import UIKit

class CollectionTableCell: UITableViewCell {
    
    @IBOutlet weak var ImageCollCell: UIImageView!    
    @IBOutlet weak var ImageCollCell2: UIImageView!
    @IBOutlet weak var LabelCollCell: UILabel!
    
    @IBOutlet weak var LabelCollCell2: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
