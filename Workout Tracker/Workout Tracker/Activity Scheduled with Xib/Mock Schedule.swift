//
//  Mock Schedule.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 3/19/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit


struct Schedule {
    var workoutName: String
    var startTime: Date
    var dateScheduled: Date
}


//random events

extension Schedule {
    init(fromStartDate: Date) {
        workoutName = ["Run", "Go to gym", "Legs"].randomValue()
        
        let day = [Int](0...27).randomValue()
        let hour = [Int](0...23).randomValue()
        let startDate = Calendar.current.date(byAdding: .day, value: day, to: fromStartDate)!
        
        
        startTime = Calendar.current.date(byAdding: .hour, value: hour, to: startDate)!
      
    }
}
