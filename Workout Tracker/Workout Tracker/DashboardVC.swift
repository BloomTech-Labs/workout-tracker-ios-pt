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
    
    var userController: UserController?
    
    let fbController = FBController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        setupViewNibs()
        
        //fetchScheduledWorkouts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTableView), name: .updateMyActivitiesTableView, object: nil)
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
    
    func fetchScheduledWorkouts() {
        fbController.fetchScheduledWorkouts { (error) in
            if let error = error {
                NSLog("There was an error fetching workouts in DashBoard")
            }
            self.tableView.reloadData()
        }
    }
    
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
        //return FBController.scheduledWorkoutArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: activityScheduledCellIdentifier, for: indexPath) as? ActivityScheduledTableViewCell else { return UITableViewCell() }
        
        
        
        
        
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
    
    
    
}
