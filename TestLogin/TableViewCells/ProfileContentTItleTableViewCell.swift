//
//  ProfileContentTItleTableViewCell.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 09/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit

class ProfileContentTItleTableViewCell: UITableViewCell {
    @IBOutlet weak var contentTitleLbl: UILabel!
    @IBOutlet weak var contentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabel(contentTitle:String) {
        contentTitleLbl.text = contentTitle
    }

    @IBAction func editTapped(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
