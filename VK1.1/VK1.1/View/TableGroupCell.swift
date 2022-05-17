//
//  TableGroupCell.swift
//  VK1.1
//
//  Created by Роман Турьянов on 17.04.2022.
//

import UIKit

class TableGroupCell: UITableViewCell {
    
    @IBOutlet weak var ImageGroup: UIImageView!
    @IBOutlet weak var shadowViewCell: UIView!
    @IBOutlet weak var animationViewCell: UIView!
    @IBOutlet weak var textGroup: UILabel!
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowViewCell.layer.shadowColor = shadowColor.cgColor
        shadowViewCell.layer.shadowOffset = .zero
        shadowViewCell.layer.shadowRadius = 4
        shadowViewCell.layer.shadowOpacity = 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowViewCell.layer.cornerRadius = bounds.height/2.542
        ImageGroup.layer.cornerRadius = bounds.height/2.542
    }
    
    @IBAction func click(_ sender: Any) {


    UIView.animate(withDuration: 1,
                        delay: 0.1,
                         usingSpringWithDamping: 0.15,
                         initialSpringVelocity: 5,
                         options: .curveEaseInOut) {
            self.animationViewCell.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
          }
        animationViewCell.transform = .identity
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
