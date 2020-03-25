//
//  OnboardingSecondViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class OnboardingSecondViewController: UIViewController {

    enum FitnessGoals: Int {
        case shape
        case weight
        case muscle
        case fitness
    }
    
    @IBOutlet var fitnessGoalsAnswers: [UIButton]!
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func fitnessGoalsSelected(_ sender: UIButton) {
        
    fitnessGoalsAnswers.forEach({$0.isSelected = false})
        sender.isSelected = true
    }
    
    @IBAction func nextAndSave(_ sender: UIButton) {
        let fitnessGoals: FitnessGoals = getSelectedFitnessGoals()
        print(fitnessGoals)
//        self.dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "toDashboard", sender: nil)
      
        
//        let viewController:
//        UIViewController = UIStoryboard(
//            name: "Dashboard", bundle: nil
//        ).instantiateViewController(withIdentifier: "Dashboard") as UIViewController
//        self.performSegue(withIdentifier: viewController, sender: nil)
//        self.present(viewController, animated: false, completion: nil)
    }
    
    func getSelectedFitnessGoals() -> FitnessGoals {
        for (index, button) in fitnessGoalsAnswers.enumerated() {
            if button.isSelected == true {
                return FitnessGoals(rawValue: index) ?? .shape
            }
        }
        return .shape
    }
 

}
