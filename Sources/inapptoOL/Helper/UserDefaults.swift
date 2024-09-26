//
//  File.swift
//
//
//  Created by Erkam Kucet on 27.05.2024.
//

import Foundation
import Combine

/***
 final class AppData: ObservableObject {
     
     private enum Key {
         static let demoData = "DemoData"
         static let switchValue = "SwitchValue"
     }
     
     static let shared = AppData()
     
     private init() {  }
     
     @UserDefault(AppData.Key.demoData) var demoData = 0
     @UserDefault(AppData.Key.switchValue) var switchValue: Bool = false
     
 }
 ***/
@propertyWrapper
public final class UserDefault<T: Codable>: NSObject {
    
    private let userDefaults: UserDefaults
    private let key: String
    private var observerContext = 0
    private let subject: CurrentValueSubject<T, Never>
    
    var wrappedValue: T {
        get {
            if let data = userDefaults.data(forKey: key),
               let value = try? JSONDecoder().decode(T.self, from: data) {
                return value
            }else {
                return subject.value
            }
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                userDefaults.set(encoded, forKey: key)
            }
            
            subject.send(newValue)
        }
    }
    
    var projectedValue: AnyPublisher<T, Never> {
        return subject.eraseToAnyPublisher()
    }
    
    init(wrappedValue defaultValue: T, _ key: String, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
        self.subject = CurrentValueSubject(defaultValue)
        super.init()
        if let data = userDefaults.data(forKey: key),
           let value = try? JSONDecoder().decode(T.self, from: data) {
            subject.send(value)
        }else {
            subject.send(defaultValue)
            userDefaults.register(defaults: [key: defaultValue])
        }
        
        userDefaults.addObserver(self, forKeyPath: key, options: .new, context: &observerContext)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if context == &observerContext {
            subject.send(wrappedValue)
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    deinit {
        userDefaults.removeObserver(self, forKeyPath: key, context: &observerContext)
    }
}

@propertyWrapper
public struct Storage<T: Codable> {
    
    private let key: String
    private let defaultValue: T
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
