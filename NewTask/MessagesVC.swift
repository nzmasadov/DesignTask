//
//  ChatVC.swift
//  NewTask
//
//  Created by Nazim Asadov on 11.03.22.
//

import UIKit
import Firebase

class MessagesVC: UIViewController, UISearchResultsUpdating {
 
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    
    var messageArray = [Message(name: "Johan Jacobs", image: UIImage(named: "person1"), date: Date(), message: "Hi"),
                        Message(name: "Bruce Williams", image: UIImage(named: "person2"), date: Date(), message: "Hello"),
                        Message(name: "Alan James", image: UIImage(named: "person3"), date: Date(), message: "Good Morning"),
                        Message(name: "Dwayne Black", image: UIImage(named: "person4"), date: Date(), message: "How are you?"),
                        Message(name: "Elmand Anderson", image: UIImage(named: "person5"), date: Date(), message: "How is going on?"),
                        Message(name: "Hugh Jackson", image: UIImage(named: "person6"), date: Date(), message: "Good night")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self


        let font = UIFont.systemFont(ofSize: 55) // <- make it larger, smaller, whatever you want.
        let config = UIImage.SymbolConfiguration(font: font)
        let image = UIImage(systemName: "plus.circle.fill", withConfiguration: config)
        addButtonOutlet.setImage(image, for: .normal)

   
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        
        print(text)
    }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        do {
        try Auth.auth().signOut()
        performSegue(withIdentifier: "toSignIn", sender: nil)
            print("pressed")
        } catch {
            print("error")
        }
            
    }
}

extension MessagesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageViewCell", for: indexPath) as! MessageViewCell
        cell.imageViewUser.image = messageArray[indexPath.row].image
        cell.fullnameUser.text = messageArray[indexPath.row].name
        cell.messageLabel.text = messageArray[indexPath.row].message
        cell.dateMessage.text = "12.11.22"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let chatVC = board.instantiateViewController(withIdentifier: "chatScreen") as! ChatScreenVC
        chatVC.username = messageArray[indexPath.row].name
        chatVC.userimage = messageArray[indexPath.row].image
        navigationController?.pushViewController(chatVC, animated: true)
    }
}
