//
//  File.swift
//  
//
//  Created by Erkam Kucet on 27.05.2024.
//

import SwiftUI

internal struct LazyView<Content: View>: View {
    
    private let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    public var body: some View {
        build()
    }
}
