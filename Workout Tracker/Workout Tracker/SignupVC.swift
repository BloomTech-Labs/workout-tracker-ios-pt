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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    // MARK: - Button Actions
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpFacebookBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpGoogleBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func alreadyUserBtnPressed(_ sender: UIButton) {
        
    }
    

}
