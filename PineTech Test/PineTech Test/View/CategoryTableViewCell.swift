//
//  CategoryTableViewCell.swift
//  PineTech Test
//
//  Created by FairCode on 11/06/20.
//  Copyright © 2020 FairCode. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewCategory: IntrinsicCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CategoryTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionViewCategory.delegate = dataSourceDelegate
        collectionViewCategory.dataSource = dataSourceDelegate
        //collectionViewAlbum.tag = row
        collectionViewCategory.setContentOffset(collectionViewCategory.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionViewCategory.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionViewCategory.contentOffset.x = newValue }
        get { return collectionViewCategory.contentOffset.x }
    }
}
