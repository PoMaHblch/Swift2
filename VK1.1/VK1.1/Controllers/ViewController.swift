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
                        
       let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
           scrollView?.addGestureRecognizer(hideKeyboardGesture)
                       }
    @IBOutlet var loadView1: UIView!
    @IBOutlet var loadView2: UIView!
    @IBOutlet var loadView3: UIView!
    
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
               
    @IBAction func loginButtonPressed(_ sender: Any) {
                 let login = loginInput.text!
                 let password = passwordInput.text!
                 hideKeyboard()
        if login == "" && password == "" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
        
        UIView.animate(withDuration: 1.0,
                       delay: 1.3,
                       options: [.curveEaseInOut,.repeat]) {
            self.loadView1.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.loadView1.alpha = 0
              }
        
            loadView1.transform = .identity
        
        
        UIView.animate(withDuration: 1.0,
                       delay: 1.4,
                       options: [.curveEaseInOut,.repeat]) {
            self.loadView2.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.loadView2.alpha = 0
              }
            loadView2.transform = .identity
        
        UIView.animate(withDuration: 1.0,
                       delay: 1.5,
                       options: [.curveEaseInOut,.repeat]) {
            self.loadView3.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.loadView3.alpha = 0
              }
        
        loadView3.transform = .identity
        
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

