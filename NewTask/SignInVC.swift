//
//  ViewController.swift
//  NewTask
//
//  Created by Nazim Asadov on 09.03.22.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.setUnderLine()
        emailTextField.setUnderLine()
        
        showHidePassword()
        
    }
    
    @IBAction func btnPasswordVisibilityClicked(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.passwordTextField.isSecureTextEntry = false
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }else {
            self.passwordTextField.isSecureTextEntry = true
            self.button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
        Firebase.Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { data, error in
            if error != nil {
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "error" , handler: nil)
            }else {
                print("login succesfulll")
                self.performSegue(withIdentifier: "toChat", sender: nil)
            }
        }
        } else {
           showAlert(title: "Error", message: "Please type something", handler: nil)
        }
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    
    
    func showHidePassword() {
        passwordTextField.rightViewMode = .unlessEditing
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 1, left: -20, bottom: 2, right: 15)
        button.frame = CGRect(x: passwordTextField.frame.size.width - 25, y: CGFloat(5), width: CGFloat(15), height: CGFloat(40))
        button.addTarget(self, action: #selector(self.btnPasswordVisibilityClicked(_:)), for: .touchUpInside)
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .always
        passwordTextField.isSecureTextEntry = true
    }
}

extension UITextField {
    
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
