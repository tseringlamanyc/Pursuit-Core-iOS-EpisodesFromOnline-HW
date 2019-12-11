//
//  Shows.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowsData: Decodable {
    let show: Show?
}

struct Show: Decodable {
    let id: Int
    let name: String
    let rating: Rating?
    let image: Images
    let type: String
}

struct Rating: Decodable {
    let average: Double?
}

struct Images: Decodable {
    let medium: String
    let original: String
}
