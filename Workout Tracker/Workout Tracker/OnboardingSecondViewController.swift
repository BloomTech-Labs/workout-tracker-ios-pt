//
//  OnboardingSecondViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class OnboardingSecondViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
