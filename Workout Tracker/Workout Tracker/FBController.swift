//
//  FBController.swift
//  Workout Tracker
//
//  Created by Seschwan on 4/18/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get    = "GET"
    case put    = "PUT"
    case post   = "POST"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case otherError
    case badData
    case badAuth
}
