//
//  MyActivitiesViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/25/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class MyActivitiesViewController: UIViewController {
    
    //    let calendarChildVC = CalendarMainViewController()
    //
    let calendarChildVC =
        //    UIStoryboard(name: "CalendarSetup").instantiateViewController(withIdentifier: "calendarSetup") as! CalendarMainViewController
        UIStoryboard(name: "CalendarSetup", bundle: nil).instantiateViewController(withIdentifier: "calendarSetup") as! CalendarMainViewController
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalendarChildVC()
        
        //        calendarChildVC.dataSource = self
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
