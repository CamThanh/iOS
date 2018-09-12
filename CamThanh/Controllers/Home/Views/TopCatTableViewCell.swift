//
//  TopCatTableViewCell.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/9/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class TopCatTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func tapShowAll(_ sender: Any) {
        
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "moveToCategories"), object: nil, userInfo: nil)
        // `default` is now a property, not a method call

        
    }
}
