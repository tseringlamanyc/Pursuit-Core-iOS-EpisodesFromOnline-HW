//
//  EpisodesTableViewCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/11/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonText: UILabel!
    
    
    func loadCell(episode: Episode) {
        episodeName.text = episode.name
        seasonText.text = "S\(episode.season) E\(episode.number)"
        
        let episodeImage = episode.image?.original ?? "https://avatars3.githubusercontent.com/u/1819208?s=400&v=4"
        
        NetworkHelper.shared.performDataTask(userurl: episodeImage) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.episodeImage.image = image
                }
            }
        }
    }
}
