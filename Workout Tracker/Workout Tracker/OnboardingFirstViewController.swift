//
//  OnboardingFirstViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class OnboardingFirstViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
    }
    

    

}
