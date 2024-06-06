//
//  File.swift
//  
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation

import Foundation
import SwiftUI

extension Image: ImageConvertable {
    public var image: Image { self }
}

extension Image {
    init(componentImage: ImageConvertable) {
        self.init(componentImage.imageName)
    }
}

extension Image {
    func setCircleImage(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
}
