//
//  ChatVC.swift
//  NewTask
//
//  Created by Nazim Asadov on 11.03.22.
//

import UIKit
import Firebase

class MessagesVC: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
 
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    
    var containText = String()
    
    var messageArray = [Message(name: "Johan Jacobs", image: UIImage(named: "person1"), date: "13.03.22", message: "Hi"),
                        Message(name: "Bruce Williams", image: UIImage(named: "person2"), date: "12.03.22", message: "Hello"),
                        Message(name: "Alan James", image: UIImage(named: "person3"), date: "09.03.22", message: "Good Morning"),
                        Message(name: "Dwayne Black", image: UIImage(named: "person4"), date: "04.03.22", message: "How are you?"),
                        Message(name: "Elmand Anderson", image: UIImage(named: "person5"), date: "01.03.22", message: "How is going on?"),
                        Message(name: "Hugh Jackson", image: UIImage(named: "person6"), date: "26.02.22", message: "Good night")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

//            initSearchController()
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
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
    
//    func initSearchController() {
//        searchController.loadViewIfNeeded()
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.enablesReturnKeyAutomatically = false
//        searchController.searchBar.returnKeyType = UIReturnKeyType.done
//        definesPresentationContext = true
//        navigationItem.searchController = searchController
//    }
    
    
    @IBAction func plusButtonPressed(_ sender: Any) {
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        containText = text
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
//        if (messageArray[indexPath.row].name?.contains(containText))! && containText == ""{
        cell.imageViewUser.image = messageArray[indexPath.row].image
        cell.fullnameUser.text = messageArray[indexPath.row].name
        cell.messageLabel.text = messageArray[indexPath.row].message
        cell.dateMessage.text = messageArray[indexPath.row].date
        
//        let timeStamp = "\(DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .long))"

//        }else {
//            print("not contain")
//        }
//
//        DispatchQueue.main.async {
//            tableView.reloadData()
        
//        }
        
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
