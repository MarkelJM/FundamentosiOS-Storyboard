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
            } else {
                print( "Login Error: ", error?.localizedDescription ?? "")
            }
        }
    }
    
}
