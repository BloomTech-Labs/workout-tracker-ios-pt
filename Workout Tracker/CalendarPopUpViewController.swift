//
//  CalendarPopUpViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/22/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class CalendarPopUpViewController: UIViewController, CalendarMainViewControllerDelegate {
    func calendarController(_ controller: CalendarMainViewController, didSelect date: Date) {
        //        let selectedDate = calendarChildVC.calendarView.selectedDates.first
    }
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBOutlet weak var durationPicker: UIDatePicker!
    
    
    var selectedDate: Date {
        get {
            //TODO: guard properly
            calendarChildVC.calendarView.selectedDates.first!
        }
    }
    var formattedDate: String {
        get {
            let formatter  = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: selectedDate)
        }
    }
    
    var formattedTime: String {
        get {
     
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: datePicker.date)
            
        }
    }
    
    var combinedDateAndTime: Date? {
        get {

            return combineDateWithTime(date: selectedDate, time: datePicker.date)
        }
    }

    
    var formattedDuration: String {
        get {
            let dcf = DateComponentsFormatter()
            dcf.unitsStyle = .brief
            return dcf.string(from: durationPicker.countDownDuration)!
          
        }
    }
    
    let calendarChildVC =
        UIStoryboard(name: "CalendarSetup", bundle: nil).instantiateViewController(withIdentifier: "calendarSetup") as! CalendarMainViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalendarChildVC()
//        self.datePicker.timeZone = TimeZone.current
        //TODO: Set Timezone when displaying the saved time.
    }
    
    func combineDateWithTime(date: Date, time: Date) -> Date? {
           let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        var mergedComponents = DateComponents()
               mergedComponents.year = dateComponents.year
               mergedComponents.month = dateComponents.month
               mergedComponents.day = dateComponents.day
               mergedComponents.hour = timeComponents.hour
               mergedComponents.minute = timeComponents.minute
               mergedComponents.second = timeComponents.second
        return calendar.date(from: mergedComponents)
       }
    
    func addCalendarChildVC(){
        addChild(calendarChildVC)
        calendarChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(calendarChildVC.view)
        
        calendarChildVC.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        calendarChildVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        calendarChildVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        calendarChildVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        
        calendarChildVC.didMove(toParent: self)
        
    }
    
    @IBAction func saveDateButtonTapped(_ sender: UIButton) {
   
        NotificationCenter.default.post(name: .saveDateTime, object: self)
   
        dismiss(animated: true)
    }
    
}


extension Notification.Name {
    static let saveDateTime = NSNotification.Name(rawValue: "")
}
