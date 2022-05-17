//
//  Friends.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.04.2022.
//

import Foundation
import UIKit

struct Friends {
    let image: UIImage?
    let name: String
    let friends: [newFriends]
}

struct newFriends {
    let image: UIImage?
    //let name: String
}

let newFrenchArray = [
    
    newFriends(image: UIImage(named: "image0")),
    newFriends(image: UIImage(named: "image1")),
    newFriends(image: UIImage(named: "image2")),
    newFriends(image: UIImage(named: "image3")),
    newFriends(image: UIImage(named: "image4")),
    newFriends(image: UIImage(named: "image5")),
]

class photoGallery {
    var images = [UIImage]()
    
    init() {
        setupGallery()
    }
    
    func setupGallery() {
        for i in 0...5{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }
}

