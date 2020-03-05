//
//  DashboardVC.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
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
    


}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // TODO: Change this to the data source.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myActivitiesCell", for: indexPath) as? DashboardMyActivitiesTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
    
}
