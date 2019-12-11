//
//  Shows.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowsData: Decodable {
    let show: Shows
}

struct Shows: Decodable {
    let id: Int
    let name: String
    let rating: Rating
    let image: Images
}

struct Rating: Decodable {
    let average: Double?
}

struct Images: Decodable {
    let medium: String
    let original: String
}
