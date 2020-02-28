//
//  WorkoutController.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/26/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get    = "GET"
    case put    = "PUT"
    case post   = "POST"
    case delete = "DELETE"
}


class WorkoutController {
    let muscleCategoryBaseURL = URL(string: "https://wger.de/api/v2/exercisecategory")!
    
    private(set) var muscleCategoryArray = [Muscle]()
    
    func fetchMuscleGroups(completion: @escaping (MuscleGroups?, Error?) -> Void) {
        var request = URLRequest(url: muscleCategoryBaseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error Fetching MuscleGroup Data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    NSLog("There was an error with the Data: \(error)")
                    completion(nil, error)
                }
                return
            }
            
            do {
                let muscleGroup = try JSONDecoder().decode(MuscleGroups.self, from: data)
                print("Do Block: \(muscleGroup)")
                self.muscleCategoryArray = muscleGroup.results
                DispatchQueue.main.async {
                    completion(muscleGroup, nil)
                }
            } catch {
                NSLog("There was an error trying to decode MuscleGroup: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
        }.resume()
    }
}
