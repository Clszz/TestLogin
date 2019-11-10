//
//  SignupViewController.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 07/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var error: UILabel!
    
    var tutor:Tutor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElement()
    }
    
    func setElement() {
        error.alpha = 0
        
        Utilities.styleTextField(firstName)
        Utilities.styleTextField(lastName)
        Utilities.styleTextField(email)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(signUp)
    }
    
    func validateFields() -> String? {
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill all the fields"
        }
        
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedPassword.isValidPassword() == false {
            return "Please make sure you write a good password"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }else {
            self.loading()
            
            let fName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let mail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pass = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: mail, password: pass) { (result, err) in
                if err != nil {
                    DispatchQueue.main.async {
                        self.showError("Error Creating User")
                        self.dismiss(animated: false, completion: nil)
                    }
                } else {
                    let db = Firestore.firestore()
                    db.collection("Tutor").document(result!.user.uid).setData(["firstName":fName, "lastName":lName]) { (error) in
                        
                        if error != nil {
                            self.showError("Error saving user")
                        }
                        
                        DispatchQueue.main.async {
                            self.dismiss(animated: false, completion: nil)
                            self.transitionToHome()
                        }
                    }
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
