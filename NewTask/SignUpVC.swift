//
//  SignUpVC.swift
//  NewTask
//
//  Created by Nazim Asadov on 10.03.22.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenterPasswordTextField: UITextField!
    
    let buttonPassword = UIButton(type: .custom).self
    let buttonReenterPassword = UIButton(type: .custom).self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullnameTextField.setUnderLine()
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
        reenterPasswordTextField.setUnderLine()
        
        showHidePassword()
        showHideReenterPassword()
    }
    

    @IBAction func signInPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
 
    @IBAction func createAccountPressed(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" && fullnameTextField.text != "" && passwordTextField.text == reenterPasswordTextField.text {
        Firebase.Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { data, error in
            if error != nil {
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "error", handler: nil)
            }else {
                self.performSegue(withIdentifier: "toChatVC", sender: nil)
                print("success")
            }
        }
        
        }else{
            print("notsucces")
        }
        
    }
    
    
    
    @IBAction func btnPasswordVisibilityClicked(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.passwordTextField.isSecureTextEntry = false
            buttonPassword.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }else {
            self.passwordTextField.isSecureTextEntry = true
            self.buttonPassword.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
//
    @IBAction func reenterPasswordVisibilityClicked(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.reenterPasswordTextField.isSecureTextEntry = false
            buttonReenterPassword.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }else {
            self.reenterPasswordTextField.isSecureTextEntry = true
            self.buttonReenterPassword.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }

    func showHidePassword() {
        passwordTextField.rightViewMode = .unlessEditing
        buttonPassword.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        buttonPassword.imageEdgeInsets = UIEdgeInsets(top: 1, left: -20, bottom: 2, right: 15)
        buttonPassword.frame = CGRect(x: passwordTextField.frame.size.width - 25, y: CGFloat(5), width: CGFloat(15), height: CGFloat(40))
        buttonPassword.addTarget(self, action: #selector(self.btnPasswordVisibilityClicked(_:)), for: .touchUpInside)
        passwordTextField.rightView = buttonPassword
        passwordTextField.rightViewMode = .always
        passwordTextField.isSecureTextEntry = true
    }

    func showHideReenterPassword() {
        reenterPasswordTextField.rightViewMode = .unlessEditing
        buttonReenterPassword.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        buttonReenterPassword.imageEdgeInsets = UIEdgeInsets(top: 1, left: -20, bottom: 2, right: 15)
        buttonReenterPassword.frame = CGRect(x: reenterPasswordTextField.frame.size.width - 25, y: CGFloat(5), width: CGFloat(15), height: CGFloat(40))
        buttonReenterPassword.addTarget(self, action: #selector(reenterPasswordVisibilityClicked(_:)), for: .touchUpInside)
        reenterPasswordTextField.rightView = buttonReenterPassword
        reenterPasswordTextField.rightViewMode = .always
        reenterPasswordTextField.isSecureTextEntry = true
    }
}


extension UIViewController {
    
    func showAlert(title:String, message:String, handler:((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
