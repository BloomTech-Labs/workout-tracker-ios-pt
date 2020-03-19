//
//  ActivityScheduledTableViewCell.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 3/19/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class ActivityScheduledTableViewCell: UITableViewCell {

    @IBOutlet weak var workoutNameLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var dateScheduledLabel: UILabel!
    
    var schedule: Schedule! {
        didSet {
            
            workoutNameLabel.text = schedule.workoutName
            
            
            let startTimeFormatter = DateFormatter()
            startTimeFormatter.dateFormat = "HH:mm"
            startTimeLabel.text = startTimeFormatter.string(from: schedule.startTime)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            dateScheduledLabel.text = dateFormatter.string(from: schedule.dateScheduled)
             
        }
    }
}
