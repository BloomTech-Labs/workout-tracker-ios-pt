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
    
    override func awakeFromNib() {
           super.awakeFromNib()
           layer.borderWidth = 1
           layer.borderColor = #colorLiteral(red: 0.9004005393, green: 0.6187065274, blue: 0.1791373985, alpha: 1)
           layer.cornerRadius = 5
       }
    var schedule: Schedule! {
        didSet {
            
            workoutNameLabel.text = schedule.workoutName
            
            
            let startTimeFormatter = DateFormatter()
            startTimeFormatter.dateFormat = "HH:mm"
            startTimeLabel.text = startTimeFormatter.string(from: schedule.startTime)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            dateScheduledLabel.text = dateFormatter.string(from: schedule.startTime)
            
        }
    }
}
