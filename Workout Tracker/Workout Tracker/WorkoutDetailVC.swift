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
    
    @IBOutlet weak var workoutImage1: UIImageView!
    @IBOutlet weak var workoutImage2: UIImageView!
    
    // MARK: - Variables
    

    
    let workoutController = WorkoutController()
    
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
        
        
        workoutController.fetchWorkoutImageURL(imageID: workout.id) { (imageURL, error) in
            if let error = error {
                NSLog("There was an error retrieving imageURLs in WorkoutDetailVC: \(error)")
                
            }
            if !self.workoutController.imageURLsArray.isEmpty {
                for image in self.workoutController.imageURLsArray {
                    self.workoutController.fetchImages(imageURL: image.image) { (image, error) in
                        if let error = error {
                            NSLog("There was an error with images: \(error)")
                        }
                        if self.workoutController.imageArray.count == 2 {
                            self.workoutImage1.image = self.workoutController.imageArray[0]
                            self.workoutImage2.image = self.workoutController.imageArray[1]
                        }
                       
                    }
                }
            } else {
                self.workoutImage1.image = UIImage(named: "noImageAvailable")
                self.workoutImage2.image = UIImage(named: "noImageAvailable")
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func saveWorkoutBtnPressed(_ sender: UIBarButtonItem) {
        guard let workout = workout else { return }
        let chosenExercise = ChosenExercise(exerciseName: workout.name, description: workout.description)
        WorkoutController.chosenExercisesArray.append(chosenExercise)
//        workoutController.chosenExercisesArray.append(chosenExercise)
//        print("ChosenExerciseArray \(workoutController.chosenExercisesArray)\n Count: \(workoutController.chosenExercisesArray.count)")
        self.dismiss(animated: true) {
            // We need to pass the workoutController Object from this VC to the WorkoutController in the CreateAScheduleVC.
            
        }
    }
    

}
