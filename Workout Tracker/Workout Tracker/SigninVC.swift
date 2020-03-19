//
//  SigninVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/15/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class SigninVC: UIViewController {
    
    // MARK: - Outlets
    // UITextFields
    @IBOutlet weak var emailTextField:    UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // UIButtons
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInButton:         UIButton!
    @IBOutlet weak var newSignupButton:      UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStyling()
        
    }
    
    // MARK: - Button Setup
    func buttonStyling() {
        signInButton.layer.cornerRadius = 5
    }
    
    
    // MARK: - Actions
    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func newSignupBtnPressed(_ sender: UIButton) {
        
    }
    

}
