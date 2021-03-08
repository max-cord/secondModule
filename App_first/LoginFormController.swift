//
//  LoginFormController.swift
//  App_first
//
//  Created by Максим on 01.03.2021.
//

import UIKit

class LoginFormController: UIViewController {
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!

    @IBOutlet weak var scrollView: UIScrollView!
    @objc func keyboardWasShown(notification: Notification) {
            let info = notification.userInfo! as NSDictionary
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
            self.scrollView?.contentInset = contentInsets
            scrollView?.scrollIndicatorInsets = contentInsets
        }
        
        @objc func keyboardWillBeHidden(notification: Notification) {
            
            let contentInsets = UIEdgeInsets.zero
            scrollView?.contentInset = contentInsets
        }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //решение из методички не заработало, нашел рабочий вариант в интернете.
  /*  @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
    
    override func viewDidLoad() {
            super.viewDidLoad()
         
            // Жест нажатия
            let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            // Присваиваем его UIScrollVIew
            scrollView?.addGestureRecognizer(hideKeyboardGesture)
        }
    */
    
    @IBAction func loginButton(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "admin" && password == "123456" {
            print("Регистрация успешна")
        }
        else {
            print("Попробуйте еще раз")
        }
    }
   
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            // Проверяем данные
            let checkResult = checkUserData()
            
            // Если данные не верны, покажем ошибку
            if !checkResult {
                showLoginError()
            }
            
            // Вернем результат
            return checkResult
        }
        
        func checkUserData() -> Bool {
            guard let login = loginInput.text,
                let password = passwordInput.text else { return false }
            
            if login == "admin" && password == "123456" {
                return true
            } else {
                return false
            }
        }
        
        func showLoginError() {
            // Создаем контроллер
            let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
            // Создаем кнопку для UIAlertController
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // Добавляем кнопку на UIAlertController
            alter.addAction(action)
            // Показываем UIAlertController
            present(alter, animated: true, completion: nil)
        }

    
    
}
