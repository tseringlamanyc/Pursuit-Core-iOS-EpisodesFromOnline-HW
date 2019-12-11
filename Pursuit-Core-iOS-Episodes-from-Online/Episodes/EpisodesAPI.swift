//
//  EpisodesAPI.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/11/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct EpisodeAPI {
    
    static func getEpisodes(episodeNum: Int, completionHandler: @escaping (Result<[Episode],AppError>) -> ()) {
        
        let episodeURL = "https://api.tvmaze.com/shows/\(episodeNum)/episodes"
        
        NetworkHelper.shared.performDataTask(userurl: episodeURL) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClinetError(appError)))
            case .success(let data):
                do {
                    let episodeData = try JSONDecoder().decode([Episode].self, from: data)
                    completionHandler(.success(episodeData))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
