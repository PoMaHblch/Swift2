//
//  TableGroupCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 17.04.2022.
//

import UIKit

class TableGroupCell: UITableViewCell {
    
    @IBOutlet weak var ImageGroup: UIImageView!
    
    @IBOutlet weak var textGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ImageGroup.layer.cornerRadius = ImageGroup.bounds.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
