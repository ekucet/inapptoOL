//
//  File.swift
//  
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation
import UIKit
import SwiftUI

extension View {
    internal func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
    
    internal func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    internal func embedInNavigation() -> some View {
        NavigationView { self }.navigationViewStyle(.stack)
    }
    
    internal func addBorder(color: Color, width: CGFloat, cornerRadius: CGFloat, corners: UIRectCorner = .allCorners, asBackgraound: Bool = false) -> some View {
        if asBackgraound {
            return background(RoundedCorner(radius: cornerRadius, corners: corners).stroke(color, lineWidth: width)).eraseToAnyView()
        }else {
            return overlay(RoundedCorner(radius: cornerRadius, corners: corners).stroke(color, lineWidth: width)).eraseToAnyView()
        }
    }
    
    internal func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    internal func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
        Group {
            if condition {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }
    
    internal func conditionalModifier<M1, M2>(_ condition: Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
        Group {
            if condition {
                self.modifier(trueModifier)
            } else {
                self.modifier(falseModifier)
            }
        }
    }
    
    @ViewBuilder 
    internal func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    internal func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
    
    internal func wrappedInHStack(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil) -> some View {
        HStack(alignment: alignment, spacing: spacing) {
            self
        }
    }
    
    internal func wrappedInVStack(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil) -> some View {
        VStack(alignment: alignment, spacing: spacing) {
            self
        }
    }
}
