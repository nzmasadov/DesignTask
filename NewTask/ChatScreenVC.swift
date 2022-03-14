//
//  ChatScreenVCViewController.swift
//  NewTask
//
//  Created by Nazim Asadov on 11.03.22.
//

import UIKit

class ChatScreenVC: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var fullnameTextField: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var threeDotOutlet: UIButton!
    var username: String?
    var userimage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullnameTextField.text = username
        userImageView.image = userimage
        
        userImageView.layer.cornerRadius = 31
        
        navigationController?.isNavigationBarHidden = true
        
        messageTextField.clipsToBounds = true
        messageTextField.layer.cornerRadius = 23
        
//        let font = UIFont.systemFont(ofSize: 10) // <- make it larger, smaller, whatever you want.
//        let config = UIImage.SymbolConfiguration(font: font)
//        let image = UIImage(named: "arrow")
//        backButtonOutlet.setImage(image, for: .normal)
        
    }

    @IBAction func backButtonPressed(_ sender: Any) {

        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
    }
    
}


