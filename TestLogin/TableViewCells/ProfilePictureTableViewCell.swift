//
//  ProfilePictureTableViewCell.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 09/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit

class ProfilePictureTableViewCell: UITableViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var universityLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    var tutor:Tutor!

    func setProfile(tutor:Tutor) {
        imageProfile?.image = UIImage(named: tutor.tutorImage ?? "")
        let fullName = tutor.tutorFirstName + " " + tutor.tutorLastName
        nameLbl.text = fullName
        universityLbl.text = tutor.educationID
        ageLbl.text = tutor.tutorBirthDate
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
