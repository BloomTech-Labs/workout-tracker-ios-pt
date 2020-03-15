//
//  WorkoutController.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/26/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case get    = "GET"
    case put    = "PUT"
    case post   = "POST"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case otherError
    case badData
}


class WorkoutController {
    let muscleCategoryBaseURL = URL(string: "https://wger.de/api/v2/exercisecategory")! // For use to get the workout categories
    let workoutBaseURL = URL(string: "https://wger.de/api/v2/exercise/?language=2&license_author=wger.de")! // For use to get workouts
    let imageBaseURL = URL(string: "https://wger.de/api/v2/exerciseimage/")! // For use to get workout images
    
    private(set) var muscleCategoryArray = [Muscle]() // For use with the fetchMuscleGroup method
    private(set) var workoutsArray = [Workout]()      // For use with the fetchWorkouts method
    private(set) var imageURLsArray = [ImageInfo]()   // For use with the fetchWorkoutImageURL
    private(set) var imageArray = [UIImage]()         // For use with the Images returned from workouts
    
    
    // MARK: - FetchMuscleGroups
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
                //print("Do Block: \(muscleGroup)")
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
    
    
    // MARK: - FetchWorkouts
    func fetchWorkouts(categoryNumber: String, completion: @escaping (Workouts?, Error?) -> Void) {
        var urlComponents = URLComponents(url: workoutBaseURL, resolvingAgainstBaseURL: true)
        
        let categorySearchTerm = URLQueryItem(name: "category", value: categoryNumber)
        let languageSearchTerm = URLQueryItem(name: "language", value: "2")
        let licenseSearchTerm = URLQueryItem(name: "license_author", value: "wger.de")
        
        urlComponents?.queryItems = [categorySearchTerm, languageSearchTerm, licenseSearchTerm]
        
        
        guard let requestURL = urlComponents?.url else { NSLog("The request is nil"); return }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        //print(request)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("There was an error in fetchWorkouts: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                NSLog("There was an error with the data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do {
                let workout = try JSONDecoder().decode(Workouts.self, from: data)
                self.workoutsArray = workout.results
                
                DispatchQueue.main.async {
                    completion(workout, nil)
                }
            } catch {
                NSLog("There was an error decoding the data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
        }.resume()
    }
    
    
    
    
    // MARK: - FetchWorkoutImages
    func fetchWorkoutImageURL(imageID: Int, completion: @escaping (WorkoutImage?, Error?) -> Void) {
        
        var urlComponets = URLComponents(url: imageBaseURL, resolvingAgainstBaseURL: true)
        let imageIdSearchTerm = URLQueryItem(name: "exercise", value: String(imageID))
        
        urlComponets?.queryItems = [imageIdSearchTerm]
        
        guard let requestURL = urlComponets?.url else { NSLog("The request is nil"); return }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        print(request)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("There was an error in the request for workoutImage: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                NSLog("There was an error with the data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do {
                let imageURL = try JSONDecoder().decode(WorkoutImage.self, from: data)
                self.imageURLsArray = imageURL.results
                print(self.imageURLsArray.count)
                print(self.imageURLsArray)
                DispatchQueue.main.async {
                    completion(imageURL, nil)
                }
            } catch {
                NSLog("There was an error decoding the data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
        }.resume()
    }
    
    func fetchImages(imageURL: String, completion: @escaping (UIImage?, Error?) ->  Void) {
        guard let imageBaseURL = URL(string: imageURL) else { return }
        var request = URLRequest(url: imageBaseURL)
        request.httpMethod = HTTPMethod.get.rawValue
    
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("There was an error in FetchImages: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                NSLog("There was an error with the data in FetchImages: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let image = UIImage(data: data) else { return }
            self.imageArray.append(image)
            print("ImageArray: \(self.imageArray) Count: \(self.imageArray.count)")
            DispatchQueue.main.async {
                completion(image, nil)
            }
        }.resume()
        
    }
    
}
