//
//  MessageViewCell.swift
//  NewTask
//
//  Created by Nazim Asadov on 11.03.22.
//

import UIKit

class MessageViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewUser.layer.cornerRadius = 31
        
    }
    @IBOutlet weak var imageViewUser: UIImageView!
    @IBOutlet weak var fullnameUser: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateMessage: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
