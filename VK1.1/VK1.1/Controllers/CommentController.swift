//
//  AnimationController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 06.05.2022.
//

import UIKit

class CommentController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(hideKeyboardGesture)

        // Do any additional setup after loading the view.
    }
    @objc func hideKeyboard() {
            self.view.endEditing(true)
       }
    
}
