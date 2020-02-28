//
//  MuscleGroup.swift
//  Workout Tracker
//
//  Created by Seschwan on 2/26/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

struct MuscleGroups: Codable {
    let results: [Muscle]
}

struct Muscle: Codable {
    let id: Int
    let name: String
}

/*
{
    "count": 7,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 10,
            "name": "Abs"
        },
        {
            "id": 8,
            "name": "Arms"
        },
        {
            "id": 12,
            "name": "Back"
        },
        {
            "id": 14,
            "name": "Calves"
        },
        {
            "id": 11,
            "name": "Chest"
        },
        {
            "id": 9,
            "name": "Legs"
        },
        {
            "id": 13,
            "name": "Shoulders"
        }
    ]
}
 */
