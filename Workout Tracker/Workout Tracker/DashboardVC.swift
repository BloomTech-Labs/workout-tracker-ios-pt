//
//  DashboardVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    let activityScheduledCellIdentifier = "activityScheduledCell"
    
    // MARK: - Outlets
    @IBOutlet weak var scheduleBtn: UIButton!
    @IBOutlet weak var viewAllScheduleBtn: UIButton!
    @IBOutlet weak var seeMoreProgressBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var activitiesSubView: UIView!
    @IBOutlet weak var overallProgressView: UIView!
    
    @IBOutlet weak var activitiesCountLbl: UILabel!
    
    @IBOutlet weak var sheildImageView: UIImageView!
    //    var totalCount = 0
    //IF I make it a global variable it adds keeps adding extra values
    
    var recentlySavedDate = Date()
    
    var userController: UserController?
    
    let fbController = FBController()
    
    var arrayOfStoredSchedules = [ScheduledWorkout]()
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        setupViewNibs()
        //        loopForNumberOfTotalWorkouts()
        //        activitiesCountLbl.text = String(totalCount)
        //        checkForGoldStatus()
        
        //fetchScheduledWorkouts()
        getScheduleFromStorage()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTableView), name: .updateMyActivitiesTableView, object: nil)
        
        NotificationCenter.default.addObserver(forName: .updateDate, object: nil, queue: OperationQueue.main) { (notification) in
            let scheduleVC = notification.object as! CreateANewScheduleVC
            self.recentlySavedDate = scheduleVC.combinedTimeAndDate
//            self.getScheduleFromStorage()
            //        let selectedDate = recentlySavedDate
            let fetched = WorkoutStorage.shared.fetch(exerciseDate: self.recentlySavedDate)
            self.arrayOfStoredSchedules = fetched
            self.tableView.reloadData()
        }
       
        //        checkForGoldStatus(totalCount)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    @objc func refreshTableView() {
        print("\nrefreshTableView Called\n")
        tableView.reloadData()
        
    }
    
    func setupUI() {
        let cornerRadius: CGFloat = 5
        let viewBorderColor = UIColor.systemGray.cgColor
        let borderWidth: CGFloat = 1
        
        scheduleBtn.layer.cornerRadius = cornerRadius
        viewAllScheduleBtn.layer.cornerRadius = cornerRadius
        seeMoreProgressBtn.layer.cornerRadius = cornerRadius
        
        overallProgressView.layer.borderColor = viewBorderColor
        overallProgressView.layer.borderWidth = borderWidth
        overallProgressView.layer.cornerRadius = cornerRadius
        activitiesSubView.backgroundColor = .systemBlue
    }
    
    func setupViewNibs() {
        
        let myNib2 = UINib(nibName: "ActivityScheduledTableViewCell", bundle: Bundle.main)
        tableView.register(myNib2, forCellReuseIdentifier: activityScheduledCellIdentifier)
    }
    
    @IBAction func goToCreateNewSchedule(_ sender: Any) {
        
        WorkoutController.chosenExercisesArray.removeAll()
        
        NotificationCenter.default.post(name: .updateCollectionView, object: self)
    }
    
    
    //    func fetchScheduledWorkouts() {
    //        fbController.fetchScheduledWorkouts { (error) in
    //            if let error = error {
    //                NSLog("There was an error fetching workouts in DashBoard")
    //            }
    //            self.tableView.reloadData()
    //        }
    //    }
    func getScheduleFromStorage() {
     //MARK: TODO
       /*
          or make a new func to fetch all and return lastest date.
         */
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("WorkoutStorage") else {preconditionFailure()}
                   
        guard let fileURLsArray = try? FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil) else {return}
        let sortedFileURLs = fileURLsArray.sorted { $0.lastPathComponent > $1.lastPathComponent }
        
        let dateString = sortedFileURLs[0].lastPathComponent
//        let selectedDate = recentlySavedDate
        let fetched = WorkoutStorage.shared.fetchByString(exerciseDateString: dateString)
        self.arrayOfStoredSchedules = fetched
      
    }
    
    fileprivate func checkForGoldStatus(_ totalCount: Int) {
        if totalCount >= 10 {
            sheildImageView.image = UIImage(named: "gold shield")
        } else {
            sheildImageView.image = UIImage(named: "silver shield")
        }
    }
    
    
    @IBAction func seeMoreProgressTapped(_ sender: Any) {
        var totalCount = 0
            guard let path2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("WorkoutStorage") else {preconditionFailure()}
            
            guard let fileURLsArray = try? FileManager.default.contentsOfDirectory(at: path2, includingPropertiesForKeys: nil) else {return}

 
            for case let fileURL in fileURLsArray {
                print(fileURL)

                let dateString = fileURL.lastPathComponent
                print(dateString)

                        let fetchedArray = WorkoutStorage.shared.fetchByString(exerciseDateString: dateString)
                        let scheduledCount = fetchedArray.count
                        print(scheduledCount)
                        totalCount += scheduledCount

            }
        print(totalCount)
        activitiesCountLbl.text = String(totalCount)
        checkForGoldStatus(totalCount)
    }
    
    func seeMoreProgressTappedOld(){
        //        loopForNumberOfTotalWorkouts(<#T##totalCount: Int##Int#>)
                let fileManager = FileManager.default
                var totalCount = 0
                do {
                    let resourceKeys : [URLResourceKey] = [.creationDateKey, .isDirectoryKey]
                    //            let documentsURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    
            
        
                    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let enumerator = FileManager.default.enumerator(at: path ,
                                                                    includingPropertiesForKeys: resourceKeys,
                                                                    options: [.skipsHiddenFiles], errorHandler: { (url, error) -> Bool in
                                                                        print("directoryEnumerator error at \(url): ", error)
                                                                        return true
                    })!
                    for case let fileURL as URL in enumerator {
                        let resourceValues = try fileURL.resourceValues(forKeys: Set(resourceKeys))
                        print(fileURL.path, resourceValues.creationDate!, resourceValues.isDirectory!)
                        
                        if resourceValues.isDirectory == true {
                            let dirContents = try fileManager.contentsOfDirectory(atPath: fileURL.path)
                            for item in dirContents {
                                print("found \(item)")
                                let fetchedArray = WorkoutStorage.shared.fetchByString(exerciseDateString: item)
                                let scheduledCount = fetchedArray.count
                                print(scheduledCount)
                                totalCount += scheduledCount
                            }
                        }
                    }
                } catch {
                    print(error)
                }
                print(totalCount)
                activitiesCountLbl.text = String(totalCount)
                checkForGoldStatus(totalCount)
    }
    
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let someArray = arrayOfStoredSchedules
        let first1 = Array(someArray.prefix(1))
        
        
        return first1.count
        
        //return FBController.scheduledWorkoutArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: activityScheduledCellIdentifier, for: indexPath) as? ActivityScheduledTableViewCell else { return UITableViewCell() }
        
        cell.scheduleFromStorage = arrayOfStoredSchedules[indexPath.row]
        cell.workoutNameLabel.text = arrayOfStoredSchedules[indexPath.row].workoutName
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.dateScheduledLabel.text = dateFormatter.string(from: arrayOfStoredSchedules[indexPath.row].startTime!)
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        cell.startTimeLabel.text = timeFormatter.string(from: arrayOfStoredSchedules[indexPath.row].startTime!)
        
        
        
        
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "Celldetail", sender: indexPath)
        modalPresentationStyle = .fullScreen
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Celldetail" {
            guard let destinationVC = segue.destination as? MyActivitiesDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            destinationVC.scheduleFromStorage = arrayOfStoredSchedules[indexPath.row]
            let cell = tableView.cellForRow(at: indexPath) as! ActivityScheduledTableViewCell
            destinationVC.delegate = cell
            //            destinationVC.schedule = schedules[indexPath.row]
            
            
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toActivityDetail" {
//            guard let destinationVC = segue.destination as? MyActivitiesDetailViewController,
//                let indexPath = tableView.indexPathForSelectedRow else { return }
//            destinationVC.scheduleFromStorage = arrayOfStoredSchedules[indexPath.row]
//         
//        }
//    }
    
    
}
