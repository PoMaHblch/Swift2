//
//  ViewController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 11.04.2022.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        load()
                        
       let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
           scrollView?.addGestureRecognizer(hideKeyboardGesture)
                       }

    @IBOutlet var loadingView: UIView!
  
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
               
    @objc func keyboardWasShown(notification: Notification) {
                       
      guard let info = notification.userInfo as NSDictionary?,
            let kbSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else
                {return}
        
        let contentInsets = kbSize.cgRectValue.size.height
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: contentInsets, right: 0.0)
                       
       }
                  
    @objc func keyboardWillBeHidden(notification: Notification) {

        scrollView?.contentInset = .zero
       }
             
    override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
                  
       NotificationCenter.default.addObserver(self, selector:
                   #selector(self.keyboardWasShown), name:
                   UIResponder.keyboardWillShowNotification, object: nil)
                      
       NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
               
    override func viewWillDisappear(_ animated: Bool) {
               super.viewWillDisappear(animated)
                   
       NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
       }
               
    @objc func hideKeyboard() {
             self.scrollView?.endEditing(true)
       }
    
    @objc func load() {
        
        let layer = CAShapeLayer()
        layer.path = bezierPath.cgPath
        layer.lineWidth = 2
        layer.strokeColor = UIColor.red.cgColor
        layer.fillColor = UIColor.gray.cgColor
        
        layer.strokeEnd = 1
        layer.strokeStart = 0
        
        loadingView.layer.addSublayer(layer)
        
        let strokeEndAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        
        let strokeStartAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeStart))
        strokeStartAnimation.fromValue = -0.1
        strokeStartAnimation.toValue = 0.9
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        animationGroup.duration = 2.5
        animationGroup.repeatCount = .infinity
        layer.add(animationGroup, forKey: nil)
   
    }
    
        let bezierPath: UIBezierPath = {
            let path = UIBezierPath()
        
            path.move(to: CGPoint(x: 12.94, y: 34.02))
            path.addCurve(to: CGPoint(x: 11.61, y: 38.57), controlPoint1: CGPoint(x: 11.75, y: 35.98), controlPoint2: CGPoint(x: 11.61, y: 38.57))
            path.addCurve(to: CGPoint(x: 11.6, y: 41.75), controlPoint1: CGPoint(x: 11.61, y: 38.57), controlPoint2: CGPoint(x: 11.37, y: 40.06))
            path.addCurve(to: CGPoint(x: 12.41, y: 45.5), controlPoint1: CGPoint(x: 11.77, y: 43.07), controlPoint2: CGPoint(x: 12.1, y: 44.57))
            path.addCurve(to: CGPoint(x: 26.74, y: 52.34), controlPoint1: CGPoint(x: 13.43, y: 48.56), controlPoint2: CGPoint(x: 15.54, y: 52.19))
            path.addCurve(to: CGPoint(x: 52.23, y: 52.34), controlPoint1: CGPoint(x: 55.16, y: 52.7), controlPoint2: CGPoint(x: 52.23, y: 52.34))
            path.addCurve(to: CGPoint(x: 61.1, y: 50.91), controlPoint1: CGPoint(x: 52.23, y: 52.34), controlPoint2: CGPoint(x: 57.3, y: 52.78))
            path.addCurve(to: CGPoint(x: 64.86, y: 48.22), controlPoint1: CGPoint(x: 62.81, y: 50.08), controlPoint2: CGPoint(x: 63.56, y: 49.77))
            path.addCurve(to: CGPoint(x: 66.29, y: 44.72), controlPoint1: CGPoint(x: 66.16, y: 46.67), controlPoint2: CGPoint(x: 66.29, y: 44.72))
            path.addCurve(to: CGPoint(x: 65.9, y: 39.34), controlPoint1: CGPoint(x: 66.29, y: 44.72), controlPoint2: CGPoint(x: 66.97, y: 41.21))
            path.addCurve(to: CGPoint(x: 62.01, y: 35.77), controlPoint1: CGPoint(x: 64.82, y: 37.47), controlPoint2: CGPoint(x: 63.69, y: 36.13))
            path.addCurve(to: CGPoint(x: 57.37, y: 36.33), controlPoint1: CGPoint(x: 60.32, y: 35.4), controlPoint2: CGPoint(x: 57.37, y: 36.33))
            path.addCurve(to: CGPoint(x: 58.08, y: 33.04), controlPoint1: CGPoint(x: 57.37, y: 36.33), controlPoint2: CGPoint(x: 58.08, y: 34.74))
            path.addCurve(to: CGPoint(x: 57.19, y: 29.54), controlPoint1: CGPoint(x: 58.08, y: 31.35), controlPoint2: CGPoint(x: 57.19, y: 29.54))
            path.addCurve(to: CGPoint(x: 54.87, y: 27.6), controlPoint1: CGPoint(x: 57.19, y: 29.54), controlPoint2: CGPoint(x: 56.25, y: 28.26))
            path.addCurve(to: CGPoint(x: 51.83, y: 26.87), controlPoint1: CGPoint(x: 53.49, y: 26.93), controlPoint2: CGPoint(x: 53.25, y: 26.9))
            path.addCurve(to: CGPoint(x: 49.2, y: 27.5), controlPoint1: CGPoint(x: 50.42, y: 26.85), controlPoint2: CGPoint(x: 49.2, y: 27.5))
            path.addLine(to: CGPoint(x: 46.89, y: 29.42))
            path.addCurve(to: CGPoint(x: 47.61, y: 26.87), controlPoint1: CGPoint(x: 46.89, y: 29.42), controlPoint2: CGPoint(x: 47.41, y: 28.25))
            path.addCurve(to: CGPoint(x: 47.67, y: 23.91), controlPoint1: CGPoint(x: 47.8, y: 25.5), controlPoint2: CGPoint(x: 47.67, y: 23.91))
            path.addCurve(to: CGPoint(x: 46.56, y: 20.59), controlPoint1: CGPoint(x: 47.67, y: 23.91), controlPoint2: CGPoint(x: 47.46, y: 22.02))
            path.addCurve(to: CGPoint(x: 44.45, y: 18.18), controlPoint1: CGPoint(x: 45.67, y: 19.16), controlPoint2: CGPoint(x: 45.67, y: 19.15))
            path.addCurve(to: CGPoint(x: 41.67, y: 16.7), controlPoint1: CGPoint(x: 43.23, y: 17.21), controlPoint2: CGPoint(x: 43, y: 17.31))
            path.addCurve(to: CGPoint(x: 38.75, y: 15.76), controlPoint1: CGPoint(x: 40.33, y: 16.09), controlPoint2: CGPoint(x: 38.75, y: 15.76))
            path.addCurve(to: CGPoint(x: 34.53, y: 15.53), controlPoint1: CGPoint(x: 38.75, y: 15.76), controlPoint2: CGPoint(x: 36.65, y: 15.39))
            path.addCurve(to: CGPoint(x: 30.3, y: 16.33), controlPoint1: CGPoint(x: 32.42, y: 15.68), controlPoint2: CGPoint(x: 30.3, y: 16.33))
            path.addCurve(to: CGPoint(x: 26.68, y: 18.26), controlPoint1: CGPoint(x: 30.3, y: 16.33), controlPoint2: CGPoint(x: 28.11, y: 17.1))
            path.addCurve(to: CGPoint(x: 24.25, y: 20.98), controlPoint1: CGPoint(x: 25.26, y: 19.42), controlPoint2: CGPoint(x: 25.05, y: 19.71))
            path.addCurve(to: CGPoint(x: 23.47, y: 23.32), controlPoint1: CGPoint(x: 23.44, y: 22.24), controlPoint2: CGPoint(x: 23.47, y: 23.32))
            path.addCurve(to: CGPoint(x: 23.05, y: 25.54), controlPoint1: CGPoint(x: 23.47, y: 23.32), controlPoint2: CGPoint(x: 23.09, y: 24.34))
            path.addCurve(to: CGPoint(x: 23.32, y: 28.1), controlPoint1: CGPoint(x: 23.01, y: 26.74), controlPoint2: CGPoint(x: 23.32, y: 28.1))
            path.addLine(to: CGPoint(x: 24.5, y: 31.04))
            path.addCurve(to: CGPoint(x: 19.98, y: 29.68), controlPoint1: CGPoint(x: 24.5, y: 31.04), controlPoint2: CGPoint(x: 22, y: 29.76))
            path.addCurve(to: CGPoint(x: 16.39, y: 30.7), controlPoint1: CGPoint(x: 17.95, y: 29.59), controlPoint2: CGPoint(x: 16.39, y: 30.7))
            path.addCurve(to: CGPoint(x: 12.94, y: 34.02), controlPoint1: CGPoint(x: 16.39, y: 30.7), controlPoint2: CGPoint(x: 14.14, y: 32.05))
            path.close()
            return path
        }()
               
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
       // let favoriteController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    
                 let login = loginInput.text!
                 let password = passwordInput.text!
                 hideKeyboard()
        if login == "" && password == "" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
  
        //self.navigationController?.pushViewController(favoriteController, animated: true)

        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
           let checkResult = checkUserData()
           if !checkResult {
                   showLoginError()
               }
           return checkResult
           }
      func checkUserData() -> Bool {
           guard let login = loginInput.text,
                     let password = passwordInput.text else {return false}
               
               if login == "" && password == "" {
                   return true
               } else {
                   return false
               }
           }
      func showLoginError() {
               let alter = UIAlertController(title: "Ошибка", message: "неверный логин или пароль", preferredStyle: .alert)
               let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
               alter.addAction(action)
               present(alter, animated: true, completion: nil)
      }
   }

