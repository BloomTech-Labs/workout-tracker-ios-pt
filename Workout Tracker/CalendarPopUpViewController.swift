//
//  CalendarPopUpViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/22/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class CalendarPopUpViewController: UIViewController {

    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var saveButton: UIButton!
    let formatter = DateFormatter()
    let calendarChildVC =
           UIStoryboard(name: "CalendarSetup", bundle: nil).instantiateViewController(withIdentifier: "calendarSetup") as! CalendarMainViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalendarChildVC()
        formatter.dateFormat = "yyyy MM dd"
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
 
    @IBAction func saveDateButtonTapped(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}
