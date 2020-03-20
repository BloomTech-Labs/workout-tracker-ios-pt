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
}


//random events

extension Schedule {
    init(fromStartDate: Date) {
        workoutName = ["Run", "Go to gym", "Legs"].randomValue()
        
        let randomDay = [Int](0...27).randomValue()
        let randomHour = [Int](0...23).randomValue()
        let randomizedDate = Calendar.current.date(byAdding: .day,
                                                   value: randomDay,
                                                   to: fromStartDate)!
        
        //start time represents both year, month,day, and the hour, minute and second.
        startTime = Calendar.current.date(byAdding: .hour,
                                          value: randomHour,
                                          to: randomizedDate)!
      
    }
}
extension Schedule : Equatable {
    static func ==(lhs: Schedule, rhs: Schedule) -> Bool {
        return lhs.startTime == rhs.startTime
    }
}

extension Schedule : Comparable {
    static func <(lhs: Schedule, rhs: Schedule) -> Bool {
        return lhs.startTime < rhs.startTime
    }
}
