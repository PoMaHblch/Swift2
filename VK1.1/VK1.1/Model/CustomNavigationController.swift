//
//  CustomNavigationController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 16.05.2022.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var hasStarted = false
    var shouldFinish = false
}

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    let interactiveTransition = CustomInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    
    let edgePanGR = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
    view.addGestureRecognizer(edgePanGR)
  }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
            
        case .push:
            return PushAnimatior()
        case .pop:
            return PopAnimatior()
        case .none:
            return nil
        @unknown default:
            return nil
        }
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    @objc private func handlePanGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            interactiveTransition.hasStarted = true
            self.popViewController(animated: true)
        case .changed:
            guard let width = recognizer.view?.bounds.width else {
                interactiveTransition.hasStarted = false
                interactiveTransition.cancel()
                return
            }
            let translation = recognizer.translation(in: recognizer.view)
            let relactiveTranslation = translation.x / width
            let progress = max(0,min(1, relactiveTranslation))
            
            interactiveTransition.update(progress)
            interactiveTransition.shouldFinish = progress > 0.45
            
        case .ended:
            interactiveTransition.hasStarted = false
            interactiveTransition.shouldFinish ? interactiveTransition.finish() : interactiveTransition.cancel()
        case .cancelled:
            interactiveTransition.hasStarted = false
            interactiveTransition.cancel()
        default:
            break
        }
    }
}
