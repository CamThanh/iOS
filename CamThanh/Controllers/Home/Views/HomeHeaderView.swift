//
//  HomeHeaderView.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/8/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var pageControl: UIPageControl!

}

extension HomeHeaderView : HomePageViewControllerDelegate
{
    func setupPageController(numberOfPages: Int)
    {
        self.pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int)
    {
        self.pageControl.currentPage = index
    }
}
