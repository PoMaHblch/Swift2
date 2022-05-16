//
//  EyeControl.swift
//  VK1.1
//
//  Created by Роман Турьянов on 28.04.2022.
//

import UIKit

class EyeControl: UIControl {
    
    @IBOutlet var eyeImage: UIImageView!

    var isEYE: Bool = false

    override  func awakeFromNib() {
        
        eyeImage.backgroundColor = .clear
        eyeImage.tintColor = .gray
    }
}
