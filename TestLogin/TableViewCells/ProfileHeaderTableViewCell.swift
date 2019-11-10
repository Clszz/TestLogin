//
//  ProfileHeaderTableViewCell.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 09/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(text:String) {
        label.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
