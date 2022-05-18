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
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var animationCell: UIView!
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 4
        shadowView.layer.shadowOpacity = 0.8
        
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowView.layer.cornerRadius = bounds.height/2.542
        CellImage.layer.cornerRadius = bounds.height/2.542
        
        
    }
    @IBAction func click(_ sender: Any) {


    UIView.animate(withDuration: 1,
                        delay: 0.1,
                         usingSpringWithDamping: 0.15,
                         initialSpringVelocity: 5,
                         options: .curveEaseInOut) {
            self.animationCell.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
          }
        animationCell.transform = .identity
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
