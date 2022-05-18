//
//  CustomPush_PopAnimation.swift
//  VK1.1
//
//  Created by Роман Турьянов on 16.05.2022.
//

import UIKit

class PushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
 
    private var animationDuration = 0.6
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        destination.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
        
        source.view.layer.anchorPoint = CGPoint(x: 0, y:0)
        source.view.layer.position = CGPoint(x: 0, y:0)
   
        destination.view.layer.anchorPoint = CGPoint(x: 0.5, y:0)
        destination.view.layer.position = CGPoint(x: source.view.frame.width/2, y:0)
    
        
        
        
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6, animations: {
                let transition = CATransform3DMakeRotation(.pi/2, 0, 0, 1)
                source.view.transform = CATransform3DGetAffineTransform(transition)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.4, animations: {
                let transition = CATransform3DMakeRotation(-.pi/2, 0, 0, 1)
                destination.view.transform = CATransform3DGetAffineTransform(transition)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                destination.view.transform = .identity
            })
        }) {finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
class PopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var animationDuration = 0.6
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        
        source.view.layer.anchorPoint = CGPoint(x: 0, y:0)
        source.view.layer.position = CGPoint(x: 0, y:0)
        
        destination.view.layer.anchorPoint = CGPoint(x: 0.5, y:0)
        destination.view.layer.position = CGPoint(x: source.view.frame.width/2, y:0)
        
        
        let transition = CATransform3DMakeRotation(-.pi/2, 0, 0, -1)
        destination.view.transform = CATransform3DGetAffineTransform(transition)
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6, animations: {
                destination.view.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4, animations: {
                let transition = CATransform3DMakeRotation(-.pi/2, 0, 0, 1)
                source.view.transform = CATransform3DGetAffineTransform(transition)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                source.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            }else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
