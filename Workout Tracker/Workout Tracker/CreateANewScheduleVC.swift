//
//  CreateANewScheduleVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/18/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class CreateANewScheduleVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var bGView: UIView!
    @IBOutlet weak var workoutCollectionView: UICollectionView!
    
    @IBOutlet weak var nameYourWorkoutTextField: UITextField!
    @IBOutlet weak var dateTextField:            UITextField!
    @IBOutlet weak var timeTextField:            UITextField!
    @IBOutlet weak var durationTextField:        UITextField!
    
    
    @IBOutlet weak var reminderToggle: UISwitch!
    
    @IBOutlet weak var libraryButton: UIButton!
    @IBOutlet weak var saveButton:    UIButton!
    
    let workoutsArray = ["Benchpress Dumbell", "Jumping Jacks", "Treadmill Run"]
    
    let fbController = FBController()
//    var workoutController: WorkoutController? {
//        didSet {
//            workoutCollectionView.reloadData()
//        }
//    }
    //var workoutController: WorkoutController? // need to have this passed from the workoutDetailVC Save button method.
    
    
    let testWorkout1 = ScheduledWorkout(workoutName: "Test Chest", startTime: Date(), hasBeenCompleted: false, duration: "1 Hour", workouts: [.init(exerciseName: "BenchPress", description: "Lifting with your chest.")])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoadCalled")
        //print(workoutController.chosenExercisesArray.count, "\n")
        backgroundSetup()
        workoutCollectionView.delegate = self
        workoutCollectionView.dataSource = self
        workoutCollectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppeared")
        //print(workoutController.chosenExercisesArray.count, "\n")
        workoutCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        //0print(workoutController.chosenExercisesArray.count, "\n")
        workoutCollectionView.reloadData()
        
    }
    
    // MARK: - Actions
    
    func backgroundSetup() {
        self.view.layer.backgroundColor = #colorLiteral(red: 1, green: 0.9566884637, blue: 0.8293842673, alpha: 1)
        bGView.layer.backgroundColor = UIColor.white.cgColor
        bGView.layer.cornerRadius = 50
        bGView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func libraryBtnPressed(_ sender: UIButton) {
//        let workoutLibraryVC = WorkoutLibraryVC()
//        workoutLibraryVC.showCancelBtn = true
    }
    
    @IBAction func reminderToggleSwitched(_ sender: UISwitch) {
        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        fbController.save(testWorkout1) { (error) in
            if let error = error {
                NSLog("There was an error saving the workout from Save Button")
                
            }
            //self.fbController.scheduledWorkoutArray.append(self.testWorkout1)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension CreateANewScheduleVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WorkoutController.chosenExercisesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "workoutRoutineCell", for: indexPath) as? WorkoutCollectionViewCell else { return UICollectionViewCell() }
        
        let workoutNames = WorkoutController.chosenExercisesArray[indexPath.row]
        collectionCell.workoutNameLbl.text = workoutNames.exerciseName
        
        collectionCell.layer.backgroundColor = UIColor.systemGray5.cgColor
        
        return collectionCell
    }
    
    
    
}
