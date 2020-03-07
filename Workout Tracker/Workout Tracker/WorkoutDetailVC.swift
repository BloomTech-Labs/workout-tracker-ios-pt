//
//  WorkoutDetailVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 3/6/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class WorkoutDetailVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var workoutTextView: UITextView!
    
    var workout: Workout? {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    

    func updateViews() {
        guard let workout = workout, isViewLoaded else { return }
        let noSpace = ""
        let formattedDescription = workout.description.replacingOccurrences(of: "</p>", with: noSpace).replacingOccurrences(of: "<p>", with: noSpace)
        
        workoutTextView.text = formattedDescription
        navigationItem.title = workout.name
    }

}
