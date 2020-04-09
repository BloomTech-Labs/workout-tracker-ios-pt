//
//  MyActivitiesDetailViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 3/2/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class MyActivitiesDetailViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    
    @IBOutlet weak var whereLocationLabel: UILabel!
    
    var schedule: Schedule? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4631554372, green: 0.3478105556, blue: 0.1369482507, alpha: 1)
    }
    
    
    @IBAction func markAsCompleted(_ sender: Any) {
        self.dismiss(animated:true)
        
    }
    
    func updateViews(){
        
    }
    
//    var schedule: Schedule! {
//          didSet {
//              
//              workoutNameLabel.text = schedule.workoutName
//              
//              
//              let startTimeFormatter = DateFormatter()
//              startTimeFormatter.dateFormat = "HH:mm"
//              startTimeLabel.text = startTimeFormatter.string(from: schedule.startTime)
//              let dateFormatter = DateFormatter()
//              dateFormatter.dateFormat = "MM/dd/yyyy"
//              dateScheduledLabel.text = dateFormatter.string(from: schedule.startTime)
//              
//          }
//    
}
