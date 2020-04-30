//
//  ActivityScheduledTableViewCell.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 3/19/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit


class ActivityScheduledTableViewCell: UITableViewCell, ActivityScheduledCellDelegate {
    func markAsCompleted() {
//        guard scheduleFromStorage.hasBeenCompleted == true else {return}
        let image = UIImage(systemName: "checkmark.rectangle")
        bellButton.setImage(image, for: .normal)

    }
    
   
    
    @IBOutlet weak var workoutNameLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var dateScheduledLabel: UILabel!
    
    @IBOutlet weak var bellButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9973149896, green: 0.9178334519, blue: 0.8440256684, alpha: 1)
        layer.cornerRadius = 5
        
    }
    

    //    var schedule: Schedule! {
    //        didSet {
    //
    //            workoutNameLabel.text = schedule.workoutName
    //
    //
    //            let startTimeFormatter = DateFormatter()
    //            startTimeFormatter.dateFormat = "HH:mm"
    //            startTimeLabel.text = startTimeFormatter.string(from: schedule.startTime)
    //            let dateFormatter = DateFormatter()
    //            dateFormatter.dateFormat = "MM/dd/yyyy"
    //            dateScheduledLabel.text = dateFormatter.string(from: schedule.startTime)
    //
    //        }
    //    }
    //
    
    var scheduleFromStorage: ScheduledWorkout! {
        didSet {
            
            workoutNameLabel.text = scheduleFromStorage.workoutName
            
            
            let startTimeFormatter = DateFormatter()
            startTimeFormatter.dateFormat = "HH:mm"
            startTimeLabel.text = startTimeFormatter.string(from: scheduleFromStorage.startTime!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            dateScheduledLabel.text = dateFormatter.string(from: scheduleFromStorage.startTime!)
            markAsCompleted()
            if scheduleFromStorage.hasBeenCompleted == true {
                 markAsCompleted()
            } else {
//                scheduleFromStorage.hasBeenCompleted == false
                let image = UIImage(systemName: "bell")
                bellButton.setImage(image, for: .normal)
            }
            
        }
    }
  
    @IBAction func selectButton(_ sender: Any) {
        if bellButton.isSelected == true {
            bellButton.isSelected = false
            //            bellButton.setImage(UIImage(named : "unselectedImage"), for: .normal
            //            )
        }else {
            bellButton.isSelected = true
            //            bellButton.setImage(UIImage(named : "selectedImage"), for: .normal)
        }
    }
    
    
}
