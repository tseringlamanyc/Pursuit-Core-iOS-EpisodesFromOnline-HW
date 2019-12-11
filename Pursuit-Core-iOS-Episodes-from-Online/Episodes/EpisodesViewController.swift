//
//  EpisodesViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/11/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var show: ShowsData!
    
    var episode = [Episode]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadEpisode(episodeID: show.show?.id ?? 0)
    }
    
    func loadEpisode(episodeID: Int) {
        EpisodeAPI.getEpisodes(episodeNum: episodeID) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let episode):
                DispatchQueue.main.async {
                    self.episode = episode
                }
            }
        }
    }
}

extension EpisodesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodesTableViewCell else {
            fatalError()
        }
        let aEpisode = episode[indexPath.row]
        cell.loadCell(episode: aEpisode)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
