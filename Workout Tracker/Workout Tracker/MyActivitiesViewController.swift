//
//  MyActivitiesViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/25/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class MyActivitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CalendarMainViewControllerDelegate {
    
    func calendarController(_ controller: CalendarMainViewController, didSelect date: Date) {
        //        getSchedule()
        //        getScheduleFromStorage()
        tableView.reloadData()
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var containerView: UIView!
    
    //    var arrayOfStoredSchedules = [Array<ScheduledWorkout>]()
    
    
    var arrayOfStoredSchedules: [ScheduledWorkout] {
        get {
            let selectedDate = calendarChildVC.calendarView.selectedDates.first!
            //                 guard let selectedDate = calendarChildVC.calendarView.selectedDates.first else {return}
            //                let now = [Date()]
            //                let dateNow = calendarChildVC.calendarView.selectDates(now)
            //                WorkoutStorage.shared.fetch(exerciseDate: dateNow.first)
            //                let selectedDate = calendarChildVC.calendarView.selectedDates.first!
            //                let fetched = WorkoutStorage.shared.fetch(exerciseDate: selectedDate)
            //                return fetched
            return WorkoutStorage.shared.fetch(exerciseDate: selectedDate)
        }
    }
    
    //
    //
    ////        set {
    ////            func getWorkout(){
    ////                WorkoutStorage.shared.fetch(exerciseDate: selectedDate)
    ////            }
    ////        }
    //        }
    //
    
    
    let numOfRandomEvent = 100
    let activityScheduledCellIdentifier = "activityScheduledCell"
    let formatter = DateFormatter()
    let calendarChildVC =
        UIStoryboard(name: "CalendarSetup", bundle: nil).instantiateViewController(withIdentifier: "calendarSetup") as! CalendarMainViewController
    
    //MARK: Mock Test Computed Properties
    //    var scheduleGroup : [String: [Schedule]]? {
    //        didSet {
    //            calendarChildVC.calendarView.reloadData()
    //            tableView.reloadData()
    //        }
    //    }
    //    var schedules: [Schedule] {
    //        get {
    //            guard let selectedDate = calendarChildVC.calendarView.selectedDates.first else {
    //                return []
    //            }
    //
    //            guard let data = scheduleGroup?[self.formatter.string(from: selectedDate)] else {
    //                return []
    //            }
    //
    //            return data.sorted()
    //        }
    //    }
    //MARK: Mock Test Computed Properties End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalendarChildVC()
        calendarChildVC.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        setupViewNibs()
        formatter.dateFormat = "yyyy MM dd"
    }
    func setupViewNibs() {
        //        let myNib = UINib(nibName: "CellView", bundle: Bundle.main)
        //        calendarView.register(myNib, forCellWithReuseIdentifier: calendarCellIdentifier)
        //
        let myNib2 = UINib(nibName: "ActivityScheduledTableViewCell", bundle: Bundle.main)
        tableView.register(myNib2, forCellReuseIdentifier: activityScheduledCellIdentifier)
    }
    
    
    //    func getScheduleFromStorage() {
    //        guard let selectedDate = calendarChildVC.calendarView.selectedDates.first else {return}
    //
    //        do {
    //                  let cached: [ScheduledWorkout] = try  WorkoutStorage.shared.fetch(exerciseDate: selectedDate)
    //                  self.arrayOfStoredSchedules.append(cached)
    //                  print(cached)
    //              } catch {
    //                  print( error )
    //              }
    //    }
    
    
    //MARK: Mock Tests calls
    //    func getSchedule(){
    //        if let startDate = calendarChildVC.calendarView.visibleDates().monthDates.first?.date {
    //            let endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate)
    //            getSchedule(fromDate: startDate, toDate: endDate!)
    //            print("Showing enddate:\(endDate)")
    //            print("Showing startdate: \(startDate)")
    //        }
    //    }
    //    func getSchedule(fromDate: Date, toDate: Date) {
    //        var schedules: [Schedule] = []
    //        for _ in 1...numOfRandomEvent {
    //            schedules.append(Schedule(fromStartDate: fromDate))
    //        }
    //
    //        scheduleGroup = schedules.group{
    //            return self.formatter.string(from: $0.startTime)}
    //        //empty string from formatter .  po a self.formatter.string
    //        //The hashable
    //    }
    // MARK: Mock tests End
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
        //        return schedules.count
        return arrayOfStoredSchedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: activityScheduledCellIdentifier, for: indexPath) as? ActivityScheduledTableViewCell else { return UITableViewCell() }
        //        cell.schedule = schedules[indexPath.row]
        
        //        cell.scheduleFromStorage = arrayOfStoredSchedules[indexPath.row]
        
        //        for workout in arrayOfStoredSchedules[indexPath.row] {
        //                    cell.workoutNameLabel.text = workout.workoutName
        //
        //                         let dateFormatter = DateFormatter()
        //                         dateFormatter.dateStyle = .short
        //                         cell.dateScheduledLabel.text = dateFormatter.string(from: workout.startTime!)
        //
        //                         let timeFormatter = DateFormatter()
        //                         timeFormatter.timeStyle = .short
        //                         cell.startTimeLabel.text = timeFormatter.string(from: workout.startTime!)
        //                }
        
        
        // Getting the workout name
        //        let workout = FBController.scheduledWorkoutArray[indexPath.row]
        //        cell.workoutNameLabel.text = workout.workoutName
        //
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateStyle = .short
        //        cell.dateScheduledLabel.text = dateFormatter.string(from: workout.startTime)
        //
        //        let timeFormatter = DateFormatter()
        //        timeFormatter.timeStyle = .short
        //        cell.startTimeLabel.text = timeFormatter.string(from: workout.startTime)
        
        
        //        print(cell.schedule!)
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toActivityDetail" {
            guard let destinationVC = segue.destination as? MyActivitiesDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            //            destinationVC.scheduleFromStorage =
            //            destinationVC.schedule = schedules[indexPath.row]
        }
    }
    
}
