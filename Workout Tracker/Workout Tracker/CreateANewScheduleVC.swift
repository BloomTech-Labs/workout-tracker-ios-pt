//
//  CreateANewScheduleVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/18/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class CreateANewScheduleVC: UIViewController{
    
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
    
    
    
    var combinedTimeAndDate = Date()
    //    var workoutController: WorkoutController? {
    //        didSet {
    //            workoutCollectionView.reloadData()
    //        }
    //    }
    //var workoutController: WorkoutController? // need to have this passed from the workoutDetailVC Save button method.
    
    
    //    let testWorkout1 = ScheduledWorkout(workoutName: "Test Chest", startTime: Date(), hasBeenCompleted: false, duration: "1 Hour", workouts: [.init(exerciseName: "BenchPress", description: "Lifting with your chest.")])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundSetup()
        workoutCollectionView.delegate = self
        workoutCollectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshCV),
                                               name: .updateCollectionView,
                                               object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(handleDatePopupClosing), name: .saveDateTime, object: nil)
        
        NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVC = notification.object as! CalendarPopUpViewController
            self.dateTextField.text = dateVC.formattedDate
            self.timeTextField.text = dateVC.formattedTime
            self.durationTextField.text = dateVC.formattedDuration
            self.combinedTimeAndDate  = dateVC.combinedDateAndTime!
        }
        
    }
    
    // 4 Called when notification is heard
    //    @objc func handleDatePopupClosing(notification: Notification) {
    //        let dateVC = notification.object as! CalendarPopUpViewController
    //        dateTextField.text = dateVC.formattedDate
    //    }
    
    @objc func refreshCV() {
        print("refreshCV called")
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
    
    @IBAction func presentPopOverCalendarPicker(_ sender: UIButton) {
        
        //        let storyboard = UIStoryboard(name: "PopOverCalendarPicker", bundle: nil)
        //        let popoverVC = storyboard.instantiateViewController(
        //                   withIdentifier: "CalendarDatePicker")
        //        popoverVC.modalPresentationStyle = .popover
        //        popoverVC.popoverPresentationController?.sourceView = sender
        //        popoverVC.popoverPresentationController?.sourceRect = sender.bounds
        //        popoverVC.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
        //        popoverVC.preferredContentSize = CGSize(width: 430, height: 490)
        //        self.present(popoverVC, animated: true)
        //
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        guard let workoutName = nameYourWorkoutTextField.text, !workoutName.isEmpty,
            let duration = durationTextField.text, !duration.isEmpty else {
                return
                
        }
        let chosenExcercises = WorkoutController.chosenExercisesArray
        
        let scheduledWorkout = ScheduledWorkout(workoutName: workoutName, startTime: combinedTimeAndDate, hasBeenCompleted: false, duration: duration, workouts: chosenExcercises)
        
        do {
            try WorkoutStorage.shared.save(workout: scheduledWorkout, for: combinedTimeAndDate)
        } catch {
            NSLog("There was an error saving the workout to Workout Storage")
        }
        
        dismiss(animated: true){
            NotificationCenter.default.post(name: .updateMyActivitiesTableView, object: self)
             NotificationCenter.default.post(name: .updateDate, object: self)
        }
        //        fbController.save(scheduledWorkout) { (error) in
        //            if let error = error {
        //                NSLog("There was an error saving the workout from Save Button")
        //
        //            }
        //
        //        }
        //        FBController.scheduledWorkoutArray.append(scheduledWorkout)
        //        print("\nSWA.Count: \(FBController.scheduledWorkoutArray.count)\n")
        //
        //        dismiss(animated: true) {
        //            NotificationCenter.default.post(name: .updateMyActivitiesTableView, object: self)
        //        }
        
        
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
