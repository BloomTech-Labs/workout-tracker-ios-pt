//
//  DashboardMyActivitiesTableViewCell.swift
//  Workout Tracker
//
//  Created by Seschwan on 3/4/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class DashboardMyActivitiesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var bellBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
