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
    
    
    var userController: UserController?
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
        showSignInAlert()
        
        // TODO: - UNCOMMENT TO HAVE SIGN IN WORK.
        
//        guard let userController = self.userController else {return}
//
//        if let username = self.emailTextField.text, !username.isEmpty, let userpassword = self.passwordTextField.text, !userpassword.isEmpty {
//            userController.logIn(username: username, userpassword: userpassword) { (error) in
//                if let error = error {
//                    NSLog("Error occured during sign up: \(error)")
//                } else {
//                    DispatchQueue.main.async {
//                        self.showSignInAlert()
//                    }
//                }
//            }
//        }
    }
    
    func showSignInAlert() {
        let alertController = UIAlertController(title: "Sign in successful", message: "Welcome to Workout Tracker", preferredStyle: .alert)
        let alertAction =  UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "toDashboardVCSegue", sender: nil)
        })
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    
    @IBAction func newSignupBtnPressed(_ sender: UIButton) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDashboardVCSegue" {
            if let dashboardVC = segue.destination as? DashboardVC {
                dashboardVC.userController = userController
            }
        }
    }
}
