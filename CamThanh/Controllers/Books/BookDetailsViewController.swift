//
//  BookDetailsViewController.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/10/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backTapped(_ sender: Any) {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "shouldShowTabBar"), object: nil, userInfo: nil)
//        self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
    
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

extension BookDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookDetails1TableViewCell", for: indexPath) as! BookDetails1TableViewCell
//            cell.lblTitle.text = "Truyện cập nhật gần đây"
//            cell.cellDelegate = self as! TopHotTableViewCellDelegate
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookTagsTableViewCell", for: indexPath) as! BookTagsTableViewCell
//            cell.lblTitle.text = "Truyện nổi bật trong tuần"
//            cell.cellDelegate = self as! TopHotTableViewCellDelegate
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookRatingTableViewCell", for: indexPath) as! BookRatingTableViewCell
//            cell.lblTitle.text = "Truyện hay nên đọc"
//            cell.cellDelegate = self as! TopHotTableViewCellDelegate
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookSummaryTableViewCell", for: indexPath) as! BookSummaryTableViewCell
            //            cell.lblTitle.text = "Truyện hay nên đọc"
            //            cell.cellDelegate = self as! TopHotTableViewCellDelegate
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
        switch indexPath.row {
        case 0:
            return 300
            
        case 1:
            return 80
        case 2:
            return 66
        default:
            return 250
        }
    }
    
}
