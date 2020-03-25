//
//  CreateANewScheduleVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/18/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class CreateANewScheduleVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameYourWorkoutTextField: UITextField!
    @IBOutlet weak var dateTextField:            UITextField!
    @IBOutlet weak var timeTextField:            UITextField!
    @IBOutlet weak var durationTextField:        UITextField!
    @IBOutlet weak var affirmationTextField:     UITextField!
    
    @IBOutlet weak var reminderToggle: UISwitch!
    
    @IBOutlet weak var libraryButton: UIButton!
    @IBOutlet weak var saveButton:    UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // MARK: - Actions
    
    
    @IBAction func libraryBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func reminderToggleSwitched(_ sender: UISwitch) {
        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
