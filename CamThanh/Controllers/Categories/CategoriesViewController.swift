//
//  CategoriesViewController.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/9/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [String] = ["Ngôn Tình", "Ngôn Tình Cổ Điển","Ngôn Tình Hiện Đại", "Kiếm Hiệp", "Tiên Hiệp", "Trinh Thám", "18+", "Meo Meo", "Gau Gau"]
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCatsTableCell", for: indexPath) as! TopCatsTableViewCell
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "catsCell", for: indexPath) as! CatsTableViewCell
            cell.lblCatName.text = self.categories[indexPath.row - 1]
            cell.lblCatQuan.text = "(69 truyện)"
            return cell
        }
        
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //        if let cell = cell as? TopHotTableViewCell {
        //            cell.collectionView.dataSource = self
        //            cell.collectionView.delegate = self
        //            cell.collectionView.reloadData()
        //            cell.collectionView.isScrollEnabled = true
        //        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.row == 0 {
            return tableView.bounds.size.height / 3
        }
        return 100
    }
    
}


