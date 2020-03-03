//
//  WorkoutSelectionVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/29/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class WorkoutSelectionVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var workoutTableView: UITableView!
    
    let workoutController = WorkoutController()
    
    var muscle: Muscle? {
        didSet {
            updateViews()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
    
    }
    

    func updateViews() {
        guard let muscle = muscle else { return }
        workoutController.fetchWorkouts(categoryNumber: String(muscle.id)) { (workout, error) in
            if error != nil {
                NSLog("There was an error fetching workouts in WSVC: \(error)")
            }
            self.workoutTableView.reloadData()
        }
        
    }
    

}

extension WorkoutSelectionVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutController.workoutsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath)
        let workout = workoutController.workoutsArray[indexPath.row]
        cell.textLabel?.text = workout.name
        
        return cell
    }
    
    
    
}
