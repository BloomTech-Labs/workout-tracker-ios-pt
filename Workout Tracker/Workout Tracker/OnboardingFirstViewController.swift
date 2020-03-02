//
//  OnboardingFirstViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit



class OnboardingFirstViewController: UIViewController {

    enum TimeWorkout: Int {
        case morning
        case afternoon
        case anytime
        case evening
    }
    @IBOutlet var timeWorkOutAnswerButtons: [UIButton]!
    
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
    }
    
    @IBAction func timeWorkOutAnswerSelected(_ sender: UIButton) {
        
    timeWorkOutAnswerButtons.forEach({$0.isSelected = false})
       
        sender.isSelected = true
    }
    

    @IBAction func nextAndSave(_ sender: UIButton) {
        let timeWorkout: TimeWorkout = getSelectedTimeWorkout()
        print(timeWorkout)
    }
    
    func getSelectedTimeWorkout() -> TimeWorkout {
        for (index, button) in timeWorkOutAnswerButtons.enumerated() {
            if button.isSelected == true {
                return TimeWorkout(rawValue: index) ?? .morning
            }
        }
        return .morning
    }

}


class SmallButtonExtension: UIButton {
 

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let newArea = CGRect(
            x: self.bounds.origin.x - 5.0,
            y: self.bounds.origin.y - 5.0,
            width: self.bounds.size.width + 10.0,
            height: self.bounds.size.height + 20.0
        )
        return newArea.contains(point)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
