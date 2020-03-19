//
//  Extensions to xibs.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 3/19/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

extension Array {
    func randomValue() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}
