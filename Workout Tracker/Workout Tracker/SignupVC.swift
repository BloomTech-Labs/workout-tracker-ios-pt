//
//  SignupVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/15/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    // MARK: - Outlets
    // UITextFields
    @IBOutlet weak var nameTextField:     UITextField!
    @IBOutlet weak var emailTextField:    UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // UIButtons
    @IBOutlet weak var signUpButton:         UIButton!
    @IBOutlet weak var signUpFacebookButton: UIButton!
    @IBOutlet weak var signUpGoogleButton:   UIButton!
    @IBOutlet weak var alreadyUserButton:    UIButton!
    
    @IBOutlet weak var facebookLbl: UILabel!
    @IBOutlet weak var googleLbl: UILabel!
    
    var userController: UserController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStyling()
        
    }
    
    // MARK: - Button Setup
    func buttonStyling() {
        let cornerRadius: CGFloat = 5
        let borderWidth: CGFloat = 1.0
        let borderColor = UIColor.black.cgColor
        
        signUpButton.layer.cornerRadius = cornerRadius
        signUpFacebookButton.layer.borderWidth = borderWidth
        signUpGoogleButton.layer.borderWidth = borderWidth
        facebookLbl.layer.borderWidth = borderWidth
        googleLbl.layer.borderWidth = borderWidth
        
        signUpFacebookButton.layer.borderColor = borderColor
        signUpGoogleButton.layer.borderColor = borderColor
        facebookLbl.layer.borderColor = borderColor
        googleLbl.layer.borderColor = borderColor
    }
    

    // MARK: - Button Actions
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        guard let userController = self.userController else {return}
        
        if let username = self.nameTextField.text, !username.isEmpty, let email = self.emailTextField.text, let userpassword = self.passwordTextField.text, !userpassword.isEmpty {
            
            userController.signUp(username: username, email: email, userpassword: userpassword) { (error) in
                if let error = error {
                    NSLog("Error occured during sign up: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign up successful", message: "Welcome to Workout Tracker", preferredStyle: .alert)
                        let alertAction =  UIAlertAction(title: "OK", style: .default, handler: { (_) in
                            self.performSegue(withIdentifier: "toOnboarding", sender: nil)
                        })
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true)
                    }
                }
            }
        }
    }
    
    @IBAction func signUpFacebookBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpGoogleBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func alreadyUserBtnPressed(_ sender: UIButton) {
        
    }
    

}
