//
//  MyActivitiesViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/25/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class MyActivitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        
        return cell
        
    }
    
    
  
    @IBOutlet weak var tableView: UITableView!
    let calendarChildVC =
        UIStoryboard(name: "CalendarSetup", bundle: nil).instantiateViewController(withIdentifier: "calendarSetup") as! CalendarMainViewController
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalendarChildVC()
    
    }
    
//    func addCalendarChildVC(){
//        addChild(calendarChildVC)
//        //        calendarChildVC.view.frame = containerView.frame
//        //        calendarChildVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        //        calendarChildVC.view.frame = CGRect(x: 0, y: 0, width:  self.containerView.frame.size.width, height: self.containerView.frame.size.height)
//        //            self.containerView.frame.width)
//        calendarChildVC.view.frame = containerView.bounds
//        containerView.addSubview(calendarChildVC.view)
//        calendarChildVC.didMove(toParent: self)
 
        
    func addCalendarChildVC(){
        addChild(calendarChildVC)
        //        calendarChildVC.view.frame = containerView.frame
        //        calendarChildVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        //        calendarChildVC.view.frame = containerView.bounds
        
        calendarChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(calendarChildVC.view)
        
        calendarChildVC.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        calendarChildVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        calendarChildVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        calendarChildVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        
        
        calendarChildVC.didMove(toParent: self)
        
        
    }
 
    
}
