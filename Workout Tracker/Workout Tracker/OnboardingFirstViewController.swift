//
//  OnboardingFirstViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit



class OnboardingFirstViewController: UIViewController {

    enum TimeWorkout: Int {
        case morning
        case afternoon
        case anytime
        case evening
    }
    @IBOutlet var timeWorkOutAnswerButtons: [UIButton]!
    
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
    }
    
    @IBAction func timeWorkOutAnswerSelected(_ sender: UIButton) {
        
    timeWorkOutAnswerButtons.forEach({$0.isSelected = false})
       
        sender.isSelected = true
    }
    

    @IBAction func nextAndSave(_ sender: UIButton) {
        let timeWorkout: TimeWorkout = getSelectedTimeWorkout()
        print(timeWorkout)
    }
    
    func getSelectedTimeWorkout() -> TimeWorkout {
        for (index, button) in timeWorkOutAnswerButtons.enumerated() {
            if button.isSelected == true {
                return TimeWorkout(rawValue: index) ?? .morning
            }
        }
        return .morning
    }

}


