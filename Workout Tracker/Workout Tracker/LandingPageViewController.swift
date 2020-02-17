//
//  LandingPageViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        getStartedButton.layer.cornerCurve
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.layer.maskedCorners = [.layerMinXMinYCorner]
        
    }
    

   
}
