//
//  File.swift
//  
//
//  Created by Erkam Kucet on 19.05.2024.
//

import Foundation

internal extension Bundle {
    static var appVersionBundle: String? {
        guard
            let info = Bundle.main.infoDictionary,
            let version = info["CFBundleShortVersionString"] as? String
        else { return "" }
        return version
    }
    
    static var appBuildBundle: String {
        guard
            let info = Bundle.main.infoDictionary,
            let version = info["CFBundleVersion"] as? String
        else { return "" }
        return version
    }
}
