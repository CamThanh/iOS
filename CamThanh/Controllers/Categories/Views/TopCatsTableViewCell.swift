//
//  TopCatsTableViewCell.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/9/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class TopCatsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TopCatsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCatsCollectionCell", for: indexPath) as! TopCatsCollectionViewCell
        // TODO: - get your data model...
        
        switch indexPath.row {
        case 0:
            cell.colorView.backgroundColor = UIColor(red: 123.0/255.0, green: 236.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            cell.lblCatName.text = "Ngôn Tình"
            cell.lblCatSubName.text = "(69 truyện)"
            cell.catCover.image = UIImage(named: "truyen1")
            return cell
        case 1:
            cell.colorView.backgroundColor = UIColor(red: 255.0/255.0, green: 205.0/255.0, blue: 207.0/255.0, alpha: 1.0)
            cell.lblCatName.text = "Trinh Thám"
            cell.lblCatSubName.text = "(69 truyện)"
            cell.catCover.image = UIImage(named: "truyen2")
            
            return cell
        case 2:
            cell.colorView.backgroundColor = UIColor(red: 162.0/255.0, green: 155.0/255.0, blue: 254.0/255.0, alpha: 1.0)
            cell.lblCatName.text = "Kiếm Hiệp"
            cell.lblCatSubName.text = "(69 truyện)"
            cell.catCover.image = UIImage(named: "truyen3")
            
            return cell
        default:
            cell.colorView.backgroundColor = UIColor(red: 255.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 1.0)
            cell.lblCatName.text = "Cổ Điển"
            cell.lblCatSubName.text = "(69 truyện)"
            cell.catCover.image = UIImage(named: "truyen1")
            
            return cell
            
        }
        
        // aaa qweqwewqewq 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
       return CGSize(width: collectionView.frame.width / 2 + 12, height: (collectionView.frame.height / 2) - 4)
    }
    
}
