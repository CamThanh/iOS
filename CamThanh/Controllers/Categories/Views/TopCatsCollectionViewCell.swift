//
//  TopCatsCollectionViewCell.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/9/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class TopCatsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var lblCatName: UILabel!
    @IBOutlet weak var catCover: UIImageView!
    
    @IBOutlet weak var lblCatSubName: UILabel!
    override func awakeFromNib() {
        self.setNeedsLayout()
    }
}
