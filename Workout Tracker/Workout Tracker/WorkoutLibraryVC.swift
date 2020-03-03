//
//  WorkoutLibraryVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class WorkoutLibraryVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    let workoutController = WorkoutController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        workoutController.fetchMuscleGroups { (muscleGroups, error) in
            if error != nil {
                NSLog("There was an error fetching Muscle Groups in ViewDidLoad: \(error)")
            }
            self.tableView.reloadData()
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToWorkoutSegue" {
            guard let workoutVC = segue.destination as? WorkoutSelectionVC,
                let indexPath = self.tableView.indexPathForSelectedRow else { return }
            let muscle = self.workoutController.muscleCategoryArray[indexPath.row]
            workoutVC.muscle = muscle
        }
    }
    
}



extension WorkoutLibraryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutController.muscleCategoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let workout = workoutController.muscleCategoryArray[indexPath.row]
        print("Workout: \(workout)")
        
        cell.textLabel?.text = workout.name
        
        
        return cell
    }
    
    
    
}
