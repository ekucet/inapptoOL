//
//  File.swift
//  
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case unknown(Error)
}
