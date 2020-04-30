//
//  FBController.swift
//  Workout Tracker
//
//  Created by Seschwan on 4/18/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

class FBController {
    let fbBaseURL = URL(string: "https://workouttracker-b9bea.firebaseio.com/")!
    
    static var scheduledWorkoutArray = [ScheduledWorkout]()
    
    func save(_ scheduledWorkout: ScheduledWorkout, completion: @escaping (Error?) -> Void) {
        var url = fbBaseURL
        url.appendPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        
        do {
            request.httpBody = try JSONEncoder().encode(scheduledWorkout)
        } catch {
            NSLog("There was an error Posting scheduled workout: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            if let error = error {
                NSLog("\(error) from the dataTask in FBController")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
        
    }
    
    func fetchScheduledWorkouts(completion: @escaping (Error?) -> Void) {
        let url = fbBaseURL.appendingPathExtension("json")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                NSLog("There was an error fetching Scheduled Workouts \(error)")
                DispatchQueue.main.async {
                    completion(error)
                    return
                }
            }
            
            guard let data = data else {
                completion(NSError())
                return
            }
            
            do {
                let scheduledWorkoutsDictionarys = try JSONDecoder().decode([String : ScheduledWorkout].self, from: data)
                print(scheduledWorkoutsDictionarys)
//                let scheduledWorkouts = Array(scheduledWorkoutsDictionarys.values).sorted { $0.startTime < $1.startTime }
//                FBController.scheduledWorkoutArray.append(contentsOf: scheduledWorkouts)
//                print("\n Scheduled Workouts", FBController.scheduledWorkoutArray.count, "\n")
//                DispatchQueue.main.async {
//                    completion(nil)
//                }
            } catch {
                NSLog("There was an error decoding Scheduled Workouts.")
                DispatchQueue.main.async {
                    completion(error)
                    return
                }
            }
        }.resume()
    }
    
    
    
    
}
