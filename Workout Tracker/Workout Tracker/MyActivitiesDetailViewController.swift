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
//        self.dismiss(animated:true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateViews(){
        guard let schedule = schedule,
            isViewLoaded else { return }
      
        title = schedule.workoutName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateLabel.text = dateFormatter.string(from: schedule.startTime)
    
        let startTimeFormatter = DateFormatter()
        startTimeFormatter.dateFormat = "HH:mm"
        timeLabel.text = startTimeFormatter.string(from: schedule.startTime)
        
    }
      
}
