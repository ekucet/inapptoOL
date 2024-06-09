//
//  File.swift
//
//
//  Created by Erkam Kucet on 19.05.2024.
//

import Foundation
import UIKit

public extension Swift.Optional where Wrapped == Bool {
    
    var orTrue: Bool {
        guard let self = self else {
            return true
        }
        return self
    }
    
    var orFalse: Bool {
        guard let self = self else {
            return false
        }
        return self
    }
    
    func isEqualTo(_ bool: Bool?) -> Bool {
        guard let self = self,
              let boolValue = bool else {
            return false
        }
        return self == boolValue
    }
}

public extension Swift.Optional where Wrapped: EmptyValueRepresentable {
    
    var orEmpty: Wrapped {
        switch self {
        case .some(let value):
            return value
        case .none:
            return Wrapped.emptyValue
        }
    }
}

public extension Swift.Optional where Wrapped == Int {
    
    func or(_ defaultValue: Int) -> Int {
        guard let self = self else {
            return defaultValue
        }
        return self
    }
    
    var isNilOrZero: Bool {
        guard let self = self else {
            return true
        }
        
        return self == 0
    }
}

public extension Swift.Optional where Wrapped == Decimal {
    
    func or(_ defaultValue: Decimal) -> Decimal {
        guard let self = self else {
            return defaultValue
        }
        return self
    }
    
    var isNilOrZero: Bool {
        guard let self = self else {
            return true
        }
        
        return self == 0
    }
}

public extension Swift.Optional {
    
    var notNil: Bool {
        return self != nil
    }
    
    var isNil: Bool {
        return self == nil
    }
}

public extension Swift.Optional where Wrapped == String {
    
    var isNilOrEmpty: Bool {
        guard let self = self else {
            return true
        }
        return self.isEmpty
    }
}

public extension Swift.Optional where Wrapped == String {
    
    func or(_ defaultValue: String) -> String {
        guard let self = self, !self.isEmpty else {
            return defaultValue
        }
        return self
    }
    
    func isEqualTo(_ string: String?) -> Bool {
        guard let self = self, let string = string else {
            return false
        }
        return self == string
    }
}

public extension Swift.Optional where Wrapped: ZeroValueRepresentable {
    
    var orZero: Wrapped {
        switch self {
        case .some(let value):
            return value
        case .none:
            return Wrapped.zeroValue
        }
    }
}

public extension Swift.Optional where Wrapped == String {
    
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    
    var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}

// Repsentables

public protocol EmptyValueRepresentable {static var emptyValue: Self { get }}

extension String: EmptyValueRepresentable {public static var emptyValue: String { return "" }}

extension Array: EmptyValueRepresentable {public static var emptyValue: [Element] { return [] }}

extension Set: EmptyValueRepresentable {public static var emptyValue: Set<Element> { return Set() }}

extension Dictionary: EmptyValueRepresentable {public static var emptyValue: [Key: Value] { return [:] }}

extension UIEdgeInsets: EmptyValueRepresentable { public static var emptyValue: UIEdgeInsets { return .zero } }

public protocol ZeroValueRepresentable { static var zeroValue: Self { get } }

extension Int: ZeroValueRepresentable { public static var zeroValue: Int { return 0 } }

extension Decimal: ZeroValueRepresentable { public static var zeroValue: Decimal { return 0 } }

extension UInt: ZeroValueRepresentable { public static var zeroValue: UInt { return 0 } }

extension Double: ZeroValueRepresentable { public static var zeroValue: Double { return 0.0 } }

extension Float: ZeroValueRepresentable { public static var zeroValue: Float { return 0.0 }}

extension CGFloat: ZeroValueRepresentable {public static var zeroValue: CGFloat { return 0.0 }}

extension CGRect: ZeroValueRepresentable {public static var zeroValue: CGRect { return .zero }}

extension UIEdgeInsets: ZeroValueRepresentable {public static var zeroValue: UIEdgeInsets { return .zero }}

extension String: ZeroValueRepresentable {public static var zeroValue: String { return "0" }}
