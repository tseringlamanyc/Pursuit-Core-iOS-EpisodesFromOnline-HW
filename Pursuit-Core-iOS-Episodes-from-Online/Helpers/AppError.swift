//
//  AppError.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Tsering Lama on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

enum AppError: Error {
    
    case badURl(String)
    case noResponse
    case networkClinetError(Error)
    case noData
    case decodingError(Error)
    case badStatusCode(Int)
    case badMIMEType
    
}
