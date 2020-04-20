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
//        self.layer.borderWidth = 1
//        self.layer.borderColor = #colorLiteral(red: 0.8314941525, green: 0.4086731076, blue: 0.1624955237, alpha: 1)
        
    }
}
