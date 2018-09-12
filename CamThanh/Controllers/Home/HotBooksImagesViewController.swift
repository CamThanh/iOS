//
//  HotBooksImagesViewController.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/8/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class HotBooksImagesViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            
            self.imageView?.image = image
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
