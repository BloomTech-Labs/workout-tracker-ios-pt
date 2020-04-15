//
//  ScheduledWorkout.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/15/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation


struct ScheduledWorkout: Codable {
    var workoutName: String
    var startTime: Date
    var hasBeenCompleted: Bool
    var duration: String
//    var workouts: [ChosenExercise]
  
}
//struct ChosenExercise: Codable {
//    var exerciseName: string
//    var description: string
//    var image: string
//
//}
