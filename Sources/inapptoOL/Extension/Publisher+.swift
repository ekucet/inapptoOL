//
//  File.swift
//  
//
//  Created by Erkam Kucet on 19.05.2024.
//

import Foundation
import Combine

internal extension Publisher {
    func withPrevious<T>() -> AnyPublisher<(previous: Output, current: Output), Failure> where Output == Optional<T> {
        scan(Optional<(Output, Output)>.none) { ($0?.1, $1) }
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
}
