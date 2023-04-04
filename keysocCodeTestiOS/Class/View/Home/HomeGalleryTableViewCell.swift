//
//  HomeGalleryTableViewCell.swift
//  keysocCodeTestiOS
//
//  Created by So Tsz Kiu on 5/4/2023.
//

import UIKit

class HomeGalleryTableViewCell: UITableViewCell {



    @IBOutlet weak var imgGallery: UIImageView!
    @IBOutlet weak var lbDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbDesc.text = "hihi"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
