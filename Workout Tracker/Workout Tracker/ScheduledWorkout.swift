//
//  ScheduledWorkout.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/15/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//
 
import UIKit


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

 
//let scheduledWorkout = ScheduledWorkout(workoutName: "w1", startTime: "s1", hasBeenCompleted: false, duration: "d1", workouts: [ChosenExercise(exerciseName: <#T##String#>, description: <#T##String#>, image: []])])
