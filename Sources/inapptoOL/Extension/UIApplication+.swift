//
//  File.swift
//  
//
//  Created by Erkam Kucet on 19.05.2024.
//

import Foundation
import UIKit

public extension UIApplication {
    static func openWebUrl(url: String) {
        guard let url = URL(string: url), UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url)
    }
}

public extension UIApplication {
    
    static func getRootViewController() -> UIViewController? {
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        
        return nil
    }
}
