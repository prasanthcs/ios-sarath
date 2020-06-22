//
//  NewsListTableViewCell.swift
//  PineTech Test
//
//  Created by FairCode on 11/06/20.
//  Copyright © 2020 FairCode. All rights reserved.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewNews: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
