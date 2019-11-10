//
//  LoginViewController.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 07/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var error: UILabel!
    var tutor:Tutor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElement()
    }
    
    func setElement() {
        error.alpha = 0
        
        Utilities.styleTextField(email)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(login)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let mail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: mail, password: pass) { (result, error) in
            if error != nil {
                self.showError(error!.localizedDescription)
            }else {
                self.setupUser()
                self.transitionToHome()
            }
        }
    }
    
    func setupUser() {
        let db = Firestore.firestore()
        
        if let userID = Auth.auth().currentUser?.uid{
            db.collection("Tutor").document(userID).getDocument { (document, err) in
                if let document = document, document.exists {
                    let educationID = document.get("educationID") as? String ?? ""
                    let firstName = document.get("tutorfirstName") as? String ?? ""
                    let lastName = document.get("tutorlastName") as? String ?? ""
                    let image = document.get("tutorImage") as? String ?? ""
                    let phoneNumber = document.get("tutorPhoneNumber") as? String ?? ""
                    let address = document.get("tutorAddress") as? String ?? ""
                    let gender = document.get("tutorGender") as? String ?? ""
                    let birthDate = document.get("tutorBirthDate") as? String ?? ""
                    let skills = document.get("tutorSkills") as? [String] ?? []
                    let experience = document.get("tutorExperience") as? [String] ?? []
                    let language = document.get("tutorLanguage") as? [String] ?? []
                    let achievement = document.get("tutorAchievement") as? [String] ?? []
                    self.tutor = Tutor(userID,educationID,firstName,lastName,image,phoneNumber,address, gender,birthDate,skills,experience,language,achievement)
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        error.text = message
        error.alpha = 1
    }
    
    func transitionToHome() {
        let destVC = HomeViewController()
        destVC.tutor = self.tutor
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func loading() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true)
    }
    
}
