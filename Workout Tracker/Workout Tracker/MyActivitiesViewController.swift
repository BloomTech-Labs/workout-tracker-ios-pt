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
    
    func addCalendarChildVC(){
        addChild(calendarChildVC)
//        calendarChildVC.view.frame = containerView.frame
        calendarChildVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        calendarChildVC.view.frame = containerView.bounds
        containerView.addSubview(calendarChildVC.view)
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
