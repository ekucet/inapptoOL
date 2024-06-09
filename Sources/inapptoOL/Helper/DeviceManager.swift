//
//  File.swift
//  
//
//  Created by Erkam Kucet on 27.05.2024.
//

import Foundation
import UIKit

public final class DeviceManager {
    
    public static var shared = DeviceManager()
    
    private init() {  }
    
    public var getDeviceLanguage: String? {
        let currentLanguage = Locale.current.languageCode
        return currentLanguage
    }
    
    public var getDeviceVendorId: String? {
        let deviceId = UIDevice.current.identifierForVendor?.uuidString
        return deviceId
    }
}
