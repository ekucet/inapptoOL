//
//  File.swift
//  
//
//  Created by Erkam Kucet on 19.05.2024.
//

import Foundation
import UIKit

public extension UIWindow {
    
    static var topMostController: UIViewController? {
        let keyWindow = UIApplication.shared.windows
            .filter { $0.isKeyWindow }
            .first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        return nil
    }
}
