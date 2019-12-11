//
//  CustomShowTableViewCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class CustomShowTableViewCell: UITableViewCell {

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showRating: UILabel!
    
    
    func loadCell(show: Shows) {
        showName.text = show.name
        showRating.text = "Rating:\(show.rating.average)"
    }
}
