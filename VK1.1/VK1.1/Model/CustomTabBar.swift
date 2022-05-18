//
//  CustomTabBar.swift
//  VK1.1
//
//  Created by Роман Турьянов on 16.05.2022.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    private lazy var clickAnimation: CAKeyframeAnimation = {
        let clickAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        clickAnimation.values = [1.0, 1.1, 0.8, 1.03, 1.0]
        clickAnimation.duration = TimeInterval(0.3)
        clickAnimation.calculationMode = CAAnimationCalculationMode.cubicPaced
        return clickAnimation
    }()
}
extension CustomTabBar: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let imageView = item.value(forKey: "view") as? UIView else {return}
        imageView.layer.add(clickAnimation, forKey: nil)
    }
}
