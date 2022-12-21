//
//  LoginViewController.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 15/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButtom: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(openKeyboard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(closeKeyboard),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func openKeyboard(){
        print("openKeyBoard")
        
    }
    
    @objc func closeKeyboard(){
        print("close Keyboard")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        emailTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
        loginButtom.alpha = 0 /* alpha = si es 1 es totalmente opaco y si es 0 transparente*/ /* alpha es la propiedad de visibilidad*/
        
        //
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 0.75,
                       initialSpringVelocity: 0,
                       options: []){
            self.emailTextField.center.x += self.view.bounds.width
            self.passwordTextField.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 5) {
            self.loginButtom.alpha = 1
        }
    }

    @IBAction func loginButtomAction(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else {
            print("email is empty")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("password is empty")
            return
        }
        NetworkLayer.shared.login(email: email, password: password) {token, error in
            if let token = token {
                LocalDataLayer.shared.save(token: token)
                print("we got a a good token")
                print(token)
                DispatchQueue.main.async {
                    //deprecated form
                    //UIApplication.shared.keyWindow?.rootViewController = HomeTabBarViewController()
                    UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first?.rootViewController = HomeTabBarViewController()
                }
                
            } else {
                print("Login Error: ", error?.localizedDescription ?? "")
            }
        }
    }
    
}
