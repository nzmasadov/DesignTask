//
//  ChatScreenVCViewController.swift
//  NewTask
//
//  Created by Nazim Asadov on 11.03.22.
//

import UIKit

class ChatScreenVC: UIViewController {

    @IBOutlet weak var message1: UIView!
    @IBOutlet weak var message2: UIView!
    @IBOutlet weak var message3: UIView!
    @IBOutlet weak var message4: UIView!
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
        
        userImageView.layer.cornerRadius = 28
        
       
        
        messageTextField.clipsToBounds = true
        messageTextField.layer.cornerRadius = 23
        
        
        message1.layer.cornerRadius = 18
        message2.layer.cornerRadius = 18
        message3.layer.cornerRadius = 18
        message4.layer.cornerRadius = 18
        
//        let font = UIFont.systemFont(ofSize: 10) // <- make it larger, smaller, whatever you want.
//        let config = UIImage.SymbolConfiguration(font: font)
//        let image = UIImage(named: "arrow")
//        backButtonOutlet.setImage(image, for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        navigationItem.hidesBackButton = true
        print("WillAppear")
    }

    @IBAction func backButtonPressed(_ sender: Any) {

        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
    }
    
}


