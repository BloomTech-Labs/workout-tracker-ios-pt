//
//  WorkoutStorage.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

 import Foundation


 class WorkoutStorage {
     var disk: DiskStorage
     var storage: CodableStorage
     let dateFormatter = { () -> DateFormatter in
         let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd"
         formatter.locale = Locale(identifier: "en_US_POSIX")
         return formatter
     }()
     init() {
         guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("WorkoutStorage") else { preconditionFailure() }
         disk = DiskStorage(path: path)
         storage = CodableStorage(storage: disk)
     }
     func save(workout: ScheduledWorkout, for exerciseDate: Date) throws {
         let exerciseDateString = dateFormatter.string(from: exerciseDate)
         var existingWorkouts: [ScheduledWorkout]
          do {
            existingWorkouts = try storage.fetch(for: exerciseDateString)
         } catch {
             existingWorkouts = [] // no workouts were saved yet
         }
         existingWorkouts.append(workout)
         try storage.save(existingWorkouts, for: exerciseDateString)
     }
     func remove(workoutName: String, for exerciseDate: Date) throws {
         let exerciseDateString = dateFormatter.string(from: exerciseDate)
         var existingWorkouts: [ScheduledWorkout]
         do {
             existingWorkouts = try storage.fetch(for: exerciseDateString)
         } catch {
             existingWorkouts = [] // no workouts were saved yet
         }
         existingWorkouts.removeAll {
             workout in
             return workout.workoutName == workoutName
         }
         try storage.save(existingWorkouts, for: exerciseDateString)
     }
     func fetch(exerciseDate: Date) -> [ScheduledWorkout] {
         let exerciseDateString = dateFormatter.string(from: exerciseDate)
         var existingWorkouts: [ScheduledWorkout]
         do {
             existingWorkouts =  try storage.fetch(for: exerciseDateString)
         } catch {
             existingWorkouts = [] // no workouts were saved yet
         }
         return existingWorkouts
     }
 }

