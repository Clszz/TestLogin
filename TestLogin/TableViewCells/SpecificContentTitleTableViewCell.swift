//
//  SpecificContentTitleTableViewCell.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 09/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit

class SpecificContentTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    func setText(text:String) {
        label.text = text
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
