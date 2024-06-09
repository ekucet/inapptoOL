//
//  File.swift
//  
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation
import SwiftUI

extension ScrollView {
    @ViewBuilder
    public func bounce(_ isBounce: Bool) -> some View {
        modifier(ScrollViewModifier(isBounces: isBounce))
    }
}
