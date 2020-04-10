//
//  WorkoutCollectionViewCell.swift
//  Workout Tracker
//
//  Created by Seschwan on 4/9/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var workoutNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
}
