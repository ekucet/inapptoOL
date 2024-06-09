//
//  File.swift
//  
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation
import SwiftUI

public class ComponentBundle {
    public static var bundle: Bundle {
        Bundle(for: Self.self)
    }
}

public protocol ImageConvertable {
    var bundle: Bundle { get }
    var imageName: String { get }
    var image: Image { get }
    var accessibilityLabel: String? { get }
}

public extension ImageConvertable {
    var bundle: Bundle { ComponentBundle.bundle }
    var imageName: String { "" }
    var image: Image { Image(componentImage: self) }
    var accessibilityLabel: String? { nil }
}

public extension RawRepresentable where Self: ImageConvertable, RawValue == String {
    var imageName: String { rawValue }
}

/**
 - Usage
public enum ComponentImage: String, ImageConvertable {
    case arrowLarge = "arrow-large"
}
**/
