//
//  TopHotTableViewCell.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/1/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

protocol TopHotTableViewCellDelegate: class
{
    func didChooseABook()
    
}

class TopHotTableViewCell: UITableViewCell {

    weak var cellDelegate: TopHotTableViewCellDelegate?
    @IBOutlet weak var lblTitle: UILabel!
    
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

extension TopHotTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tophotCollectionCell", for: indexPath) as! TopHotCollectionViewCell
        // TODO: - get your data model...
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        return CGSize(width: collectionView.bounds.width / 3 , height: collectionView.frame.height)
        //        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        //        layout.minimumLineSpacing = 0.0
        //        layout.minimumInteritemSpacing = 0.0
        //
        //        let numberOfItemsPerRow: CGFloat = 1.0
        //        let itemWidth = (collectionView.bounds.width - 8) / numberOfItemsPerRow
        //
        //        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        self.performSegue(withIdentifier: "goToBookDetails", sender: nil)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let tempVC = storyboard.instantiateViewController(withIdentifier: "BookDetailsViewController")
//        //        self.navigationController?.pushViewController(tempVC, animated: true)
//        self.present(tempVC, animated: true, completion: nil)
        
        self.cellDelegate?.didChooseABook()
    }
    
}


