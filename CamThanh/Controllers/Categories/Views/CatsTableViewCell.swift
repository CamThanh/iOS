//
//  CatsTableViewCell.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/9/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class CatsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCatQuan: UILabel!
    @IBOutlet weak var lblCatName: UILabel!
    @IBOutlet weak var catCover: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
