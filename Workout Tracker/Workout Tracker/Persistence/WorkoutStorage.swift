//
//  WorkoutStorage.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

class WorkoutStorage {
    
    let path = URL(fileURLWithPath: NSTemporaryDirectory())
    let dateFormatter = DateFormatter()

    func save(workout: ScheduledWorkout, exerciseDate: Date) {
    
        let disk = DiskStorage(path: path)
        let storage = CodableStorage(storage: disk)
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let exerciseDate = dateFormatter.string(from: Date())
        
        if () {
              try fetch(exerciseDate: exerciseDate)
        }
        else {
            do {
                try storage.save([workout], for: exerciseDate)
            } catch {
                print(error)
            }
        }
        
    }
    
    func fetch(exerciseDate: String) {
        let disk = DiskStorage(path: path)
        let storage = CodableStorage(storage: disk)
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let exerciseDate = dateFormatter.string(from: Date())
        
        do {
            let _: [ScheduledWorkout] = try storage.fetch(for: exerciseDate)
        } catch {
            print(error)
        }
}
}

