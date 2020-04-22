//
//  ScheduledWorkout.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/15/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit
 
// Corey's workingModel

//struct DayScheduled: Codable {
//    var dayScheduled: Date
//    var scheduledWorkout: [ScheduledWorkout]
//}

struct ScheduledWorkout: Codable {
    var workoutName: String
    var startTime: Date
    var hasBeenCompleted: Bool
    var duration: String
    var workouts: [ChosenExercise]
  
}
struct ChosenExercise: Codable {
    var exerciseName: String
    var description: String
    //var image: [ExerciseImage]

}

//struct ExerciseImage: Codable {
//    var image: URL
//}
 
/*
//Stephanie's workingModel
struct ScheduledWorkout: Codable, Equatable {
    
    var workoutName: String
    var startTime: Date?
    var hasBeenCompleted: Bool?
    var duration: String?
    var workouts: [ChosenExercise]
    
}
struct ChosenExercise: Codable, Equatable {
    var exerciseName: String
    var description: String
    var image: [ExerciseImage]
}
struct ExerciseImage: Codable, Equatable {
    var image: URL
}

*/
