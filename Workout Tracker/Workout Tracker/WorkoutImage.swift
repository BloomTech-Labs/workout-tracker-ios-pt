//
//  WorkoutImage.swift
//  Workout Tracker
//
//  Created by Seschwan on 3/9/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

struct WorkoutImage: Codable {
    let results: [ImageInfo]
}

struct ImageInfo: Codable {
    let exercise: Int
    let image: String
}


/*
 
 https://wger.de/api/v2/exerciseimage/?exercise=91
 {
     "count": 2,
     "next": null,
     "previous": null,
     "results": [
         {
             "id": 3,
             "license_author": "",
             "status": "2",
             "image": "https://wger.de/media/exercise-images/91/Crunches-1.png",
             "is_main": true,
             "license": 1,
             "exercise": 91
         },
         {
             "id": 4,
             "license_author": "Everkinetic",
             "status": "2",
             "image": "https://wger.de/media/exercise-images/91/Crunches-2.png",
             "is_main": true,
             "license": 1,
             "exercise": 91
         }
     ]
 }
 
 
 
 */
