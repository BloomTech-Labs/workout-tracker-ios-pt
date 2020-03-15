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
                NSLog("There was an error retrieving imageURLs in WDVC: \(error)")
                
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
                self.workoutImage1.image = UIImage(systemName: "nosign")
                self.workoutImage2.image = UIImage(systemName: "nosign")
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func chooseWorkoutBtnPressed(_ sender: UIBarButtonItem) {
        
        
    }
    

}
