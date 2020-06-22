//
//  IntrinsicCollectionView.swift
//  SwapApick
//
//  Created by user on 05/10/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class IntrinsicCollectionView: UICollectionView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        var size = super.contentSize
        if size.width == 0 || size.height == 0 {
            // return a default size
            size = CGSize(width: 100, height: 100)
        }
        return size
    }
    
    override func reloadData() {
        super.reloadData()
        self.layoutIfNeeded()
        self.invalidateIntrinsicContentSize()
    }
}
