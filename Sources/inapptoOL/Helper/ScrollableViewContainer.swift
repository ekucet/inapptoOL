//
//  File.swift
//  
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation
import SwiftUI
import SwiftUIIntrospect

public struct ScrollableViewContainer<Content>: View where Content: View {
    let keyboardWillHideNotification = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
    
    let content: () -> Content
    @State var topSpace: CGFloat = 0
    @State var tempScrollView: UIScrollView?
    @Binding var shouldScroll: Bool
    
    private var axes: Axis.Set {
           return shouldScroll ? .vertical : []
    }
    
    public init(shouldScroll: Binding<Bool> = .constant(true),@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._shouldScroll = shouldScroll
    }
    
    public var body: some View {
        GeometryReader { geo in
            ScrollView(axes, showsIndicators: false) {
                content()
                    .frame(minWidth: geo.size.width,
                           idealWidth: geo.size.width,
                           maxWidth: geo.size.width,
                           minHeight: geo.size.height,
                           maxHeight: .infinity,
                           alignment: .top)
                
            }.onReceive(keyboardWillHideNotification, perform: { _ in
                self.tempScrollView?.setContentOffset(CGPoint(x: 0, y: topSpace), animated: true)
            })
            .introspect(.scrollView, on: .iOS(.v14, .v15, .v16, .v17), customize: { scroll in
                if topSpace == 0{
                    topSpace = scroll.contentOffset.y
                }
                self.tempScrollView = scroll
            })
            //.keyboardResponsive()
        }
    }
    
   
    
    func getBig(_ mainHeight: CGFloat, contenHeight: CGFloat) -> CGFloat{
        return mainHeight
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
