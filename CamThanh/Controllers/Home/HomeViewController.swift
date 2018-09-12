//
//  HomeViewController.swift
//  CamThanh
//
//  Created by Thanh Tran on 8/30/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var homeHeaderView: HomeHeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    struct Storyboard {
        static let showHomePageView = "showHomePageView"

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showHomePageView {
            if let imagesPageVC = segue.destination as? HomePageViewController {
                
                let image1 = UIImage(named: "truyen1")
                let image2 = UIImage(named: "truyen2")
                let image3 = UIImage(named: "truyen3")
                var images = [image1,image2,image3]
               
                
                
                imagesPageVC.images = images as! [UIImage]
                imagesPageVC.homePageViewDelegate = homeHeaderView
            }
        }
        if segue.identifier == "goToBookDetails" {
//            if let imagesPageVC = segue.destination as? HomePageViewController {
//
//                let image1 = UIImage(named: "truyen1")
//                let image2 = UIImage(named: "truyen2")
//                let image3 = UIImage(named: "truyen3")
//                var images = [image1,image2,image3]
//
//
//
//                imagesPageVC.images = images as! [UIImage]
//                imagesPageVC.homePageViewDelegate = homeHeaderView
//            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tophotTableCell", for: indexPath) as! TopHotTableViewCell
            cell.lblTitle.text = "Truyện cập nhật gần đây"
            cell.cellDelegate = self as! TopHotTableViewCellDelegate
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tophotTableCell", for: indexPath) as! TopHotTableViewCell
            cell.lblTitle.text = "Truyện nổi bật trong tuần"
            cell.cellDelegate = self as! TopHotTableViewCellDelegate
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tophotTableCell", for: indexPath) as! TopHotTableViewCell
            cell.lblTitle.text = "Truyện hay nên đọc"
            cell.cellDelegate = self as! TopHotTableViewCellDelegate
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCatTableCell", for: indexPath) as! TopCatTableViewCell
//            cell.lblTitle.text = "Thể loại phổ biến"
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TopHotTableViewCell {
//            cell.collectionView.dataSource = self
//            cell.collectionView.delegate = self
//            cell.collectionView.reloadData()
//            cell.collectionView.isScrollEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return tableView.bounds.size.height / 3
        }
        return 250
    }
    
}

extension HomeViewController: TopHotTableViewCellDelegate {
    func didChooseABook() {
        
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "shouldHideTabBar"), object: nil, userInfo: nil)

        // `default` is now a property, not a method call
        self.performSegue(withIdentifier: "goToBookDetails", sender: nil)
    }
    
}






