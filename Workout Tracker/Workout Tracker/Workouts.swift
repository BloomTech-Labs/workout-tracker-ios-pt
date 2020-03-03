//
//  Workouts.swift
//  Workout Tracker
//
//  Created by Seschwan on 3/2/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

struct Workouts: Codable {
    var results: [Workout]
}

struct Workout: Codable {
    let name: String
    let description: String
}



/*
 {
 "count": 7,
 "next": null,
 "previous": null,
 "results": [
     {
         "id": 91,
         "license_author": "wger.de",
         "status": "2",
         "description": "<p>Lay down on your back a soft surface, the feet are on the floor. Ask a partner or use some other help (barbell, etc.) to keep them fixed, your hands are behind your head. From this position move your upper body up till your head or elbows touch your knees. Do this movement by rolling up your back.</p>",
         "name": "Crunches",
         "name_original": "Crunches",
         "creation_date": null,
         "uuid": "d325dd5c-6833-41c7-8eea-6b95c4871133",
         "license": 1,
         "category": 10,
         "language": 2,
         "muscles": [
             6
         ],
         "muscles_secondary": [
             3
         ],
         "equipment": [
             8,
             4
         ]
     }
 
 */
