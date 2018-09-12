//
//  TopHotCollectionViewCell.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/1/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

protocol HomeHotCollectionrDelegate: class
{
    func didChooseABook()
}

class TopHotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    override func awakeFromNib() {
        
        self.bookCover.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.bookCover.layer.shadowColor = UIColor.black.cgColor
        self.bookCover.layer.shadowRadius = 4
        self.bookCover.layer.shadowOpacity = 0.25
        self.bookCover.clipsToBounds = true
        self.bookCover.layer.masksToBounds = false
 
//        self.containerView.layer.cornerRadius = 5
//        self.containerView.clipsToBounds = true
//        self.containerView.layer.masksToBounds = true
        
        
        
        self.setNeedsLayout()
    }
}
