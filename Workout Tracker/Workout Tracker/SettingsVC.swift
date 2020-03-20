//
//  SettingsVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextLbl: UILabel!
    @IBOutlet weak var resetPasswordBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStyling()
        
    }
    

    // MARK: - Actions
    
    @IBAction func resetPasswordBtnPressed(_ sender: UIButton) {
        passwordResetAlert()
    }
    
    func buttonStyling() {
        resetPasswordBtn.layer.cornerRadius = 5
    }
    
    func passwordResetAlert() {
        guard let emailText = emailTextLbl.text else { return }
        let alert = UIAlertController(title: "Password Reset!", message: "An email has been sent to \(emailText). Please follow the link to reset your password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
