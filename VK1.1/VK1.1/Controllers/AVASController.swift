//
//  AVASController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 15.04.2022.
//

import UIKit

class AVASController: UIViewController {
    
    @IBOutlet var animationView: UIView!
    
    @IBAction func tap(_ sender: Any) {
    
    
        UIView.animate(withDuration: 1,
                            delay: 0.1,
                             usingSpringWithDamping: 0.15,
                             initialSpringVelocity: 5,
                             options: .curveEaseInOut) {
                self.animationView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
              }
            animationView.transform = .identity
        }
    

    @IBOutlet var topView: NSLayoutConstraint!
    
    
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
