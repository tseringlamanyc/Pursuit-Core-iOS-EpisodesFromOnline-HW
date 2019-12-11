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
    
    func loadCell(show: ShowsData) {
        showName.text = show.show?.name
        let rating = show.show?.rating?.average
        
        showRating.text = "Rating: \(rating?.description ?? "N/A")"
        
        guard let imageURL = show.show?.image?.medium else {
            return
        }
        
        NetworkHelper.shared.performDataTask(userurl: imageURL) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.showImage.image = image
                }
            }
        }
    }
}
