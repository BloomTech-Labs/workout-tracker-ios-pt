//
//  MyActivitiesDetailViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 3/2/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class MyActivitiesDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4631554372, green: 0.3478105556, blue: 0.1369482507, alpha: 1)
    }
    
    
    @IBAction func markAsCompleted(_ sender: Any) {
        self.dismiss(animated:true)
        
    }
    
    
}
