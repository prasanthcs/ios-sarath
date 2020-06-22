//
//  ImageSlideshowTableViewCell.swift
//  PineTech Test
//
//  Created by FairCode on 11/06/20.
//  Copyright © 2020 FairCode. All rights reserved.
//

import UIKit
import ImageSlideshow

class ImageSlideshowTableViewCell: UITableViewCell {

    @IBOutlet weak var slideShow: ImageSlideshow!
    var newsDatas : NewsModel?
    var imagesArray = [AlamofireSource]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        slideShow.activityIndicator = DefaultActivityIndicator()
        slideShow.layer.cornerRadius = 10
        slideShow.slideshowInterval = 3.0
        slideShow.contentScaleMode = UIView.ContentMode.scaleAspectFill
        slideShow.setImageInputs(imagesArray)
    }
}
