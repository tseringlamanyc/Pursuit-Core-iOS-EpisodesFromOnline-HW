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
        
         let imageURL = show.show?.image?.original ?? "https://avatars3.githubusercontent.com/u/1819208?s=400&v=4"
        
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
