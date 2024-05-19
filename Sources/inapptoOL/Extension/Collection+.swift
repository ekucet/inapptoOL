//
//  File.swift
//  
//
//  Created by Erkam Kucet on 19.05.2024.
//

import Foundation

internal extension Collection {
    subscript (safe index: Self.Index) -> Iterator.Element? {
        (startIndex ..< endIndex).contains(index) ? self[index] : nil
    }
}

internal extension Collection {
    subscript(safeIndex index: Index) -> Element? {
        guard indices.contains(index) else {
            print("💣 Error: The index is out of the range.")
            return nil
        }
        return self[index]
    }
}
