//
//  TableCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.04.2022.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var CellImage: UIImageView!
    @IBOutlet weak var CellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CellImage.layer.cornerRadius = CellImage.bounds.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
