//
//  ViewController.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 07/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElement()
    }
    
    func setElement() {
        Utilities.styleFilledButton(signUp)
        Utilities.styleHollowButton(login)
    }

}

