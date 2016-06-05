//
//  ChatTableViewCell.swift
//
//  Created by Corey Baker on 4/11/16.
//  Copyright © 2016 University of California San Diego - ECE 158B. All rights reserved.
//  Followed and made additions to original tutorial by Gabriel Theodoropoulos - http://www.appcoda.com/intro-multipeer-connectivity-framework-ios-programming/
//

import UIKit

class MPCChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel! = UILabel()
    @IBOutlet weak var nameLabel: UILabel! = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
