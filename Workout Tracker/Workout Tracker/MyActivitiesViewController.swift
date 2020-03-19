//
//  MyActivitiesViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/25/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class MyActivitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CalendarMainViewControllerDelegate, CalendarMainViewControllerDelegate2 {
    func calendarController(_ controller: CalendarMainViewController, didScrollTo visibleDates: [Date]) {
//        getSchedule()
    }
    
   
    
    func calendarController(_ controller: CalendarMainViewController, didSelect date: Date) {
        //trigger point
        //should work like DidSelectCell on calendarMainVC
        //now should try to make the stuff work from this VC only.
//        tableView.reloadData()
        getSchedule()
    }
    
    
  
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var containerView: UIView!
    let numOfRandomEvent = 10
    let activityScheduledCellIdentifier = "activityScheduledCell"
    let formatter = DateFormatter()
    let calendarChildVC =
      UIStoryboard(name: "CalendarSetup", bundle: nil).instantiateViewController(withIdentifier: "calendarSetup") as! CalendarMainViewController
    
   var scheduleGroup : [String: [Schedule]]? {
           didSet {
               calendarChildVC.calendarView.reloadData()
               tableView.reloadData()
           }
       }
    var schedules: [Schedule] {
           get {
            guard let selectedDate = calendarChildVC.calendarView.selectedDates.first else {
                   return []
               }
               
               guard let data = scheduleGroup?[self.formatter.string(from: selectedDate)] else {
                   return []
               }
               
               return data.sorted()
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalendarChildVC()
        calendarChildVC.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        setupViewNibs()
    }
    func setupViewNibs() {
//        let myNib = UINib(nibName: "CellView", bundle: Bundle.main)
//        calendarView.register(myNib, forCellWithReuseIdentifier: calendarCellIdentifier)
//
        let myNib2 = UINib(nibName: "ActivityScheduledTableViewCell", bundle: Bundle.main)
        tableView.register(myNib2, forCellReuseIdentifier: activityScheduledCellIdentifier)
    }
    

    func getSchedule(){
        let startDate = (calendarChildVC.calendarView.visibleDates().monthDates.first!.date)
        getSchedule(fromDate: startDate)
    }
    func getSchedule(fromDate: Date) {
        var schedules: [Schedule] = []
        for _ in 1...numOfRandomEvent {
            schedules.append(Schedule(fromStartDate: fromDate))
        }
        
        scheduleGroup = schedules.group{self.formatter.string(from: $0.startTime)}
        //The hashable
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toActivityDetail", sender: indexPath)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: activityScheduledCellIdentifier, for: indexPath) as! ActivityScheduledTableViewCell
        cell.schedule = schedules[indexPath.row]
        return cell
        
    }
    

}
