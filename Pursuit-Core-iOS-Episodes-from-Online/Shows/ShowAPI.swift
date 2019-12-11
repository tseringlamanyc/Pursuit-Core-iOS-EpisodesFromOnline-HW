//
//  ShowAPI.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowsAPI {
    
    static func getShows(userSearch: String, completionHandler: @escaping (Result<[Shows], AppError>) -> ()) {
        
        let showsURL = "https://api.tvmaze.com/search/shows?q=\(userSearch)"
        
        NetworkHelper.shared.performDataTask(userurl: showsURL) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                do {
                    let showData = try JSONDecoder().decode([Shows].self, from: data)
                    completionHandler(.success(showData))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
