//
//  File.swift
//
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation
import SwiftUI
import SwiftUIIntrospect

struct ScrollViewModifier: ViewModifier {
    
    private var isBounces: Bool
    
    init(isBounces: Bool) {
        self.isBounces = isBounces
    }
    
    func body(content: Content) -> some View {
        content
            .introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { scrollView in
                scrollView.bounces = false
            }
    }
}
