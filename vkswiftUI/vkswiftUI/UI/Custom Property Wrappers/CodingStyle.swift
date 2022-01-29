//
//  CodingStyle.swift
//  vkswiftUI
//
//  Created by Home on 27.01.2022.
//

import UIKit
import SwiftUI

@propertyWrapper struct CodingStyle<Value: StringProtocol>: DynamicProperty {
    //camelCase    snake_case    kebab-case
    enum TypeStyle {
        case camelCase, snakeCase, kebabCase
    }
    
    @State private var value: Value
    private var typeStyle: TypeStyle
    
    public var projectedValue: Binding<Value> {
        Binding (
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )    
    }
    
    init(wrappedValue: Value, typeStyle: TypeStyle) {
        _value = State(wrappedValue: wrappedValue)
        self.typeStyle = typeStyle
    }
    
    private func get() -> Value {
        switch typeStyle {
        case .camelCase:
            return Value(stringLiteral: value.toCamelCase())
        case .snakeCase:
            return Value(stringLiteral: value.toSnakeCase())
        case .kebabCase:
            return Value(stringLiteral: value.toKebabCase())
        }
    }
    
    private nonmutating func set(_ newValue: Value) {
        switch typeStyle {
        case .camelCase:
            value = Value(stringLiteral: newValue.toCamelCase())
        case .snakeCase:
            value = Value(stringLiteral: newValue.toSnakeCase())
        case .kebabCase:
            value = Value(stringLiteral: newValue.toKebabCase())
        }
    }
    
    public var wrappedValue: Value {
        get {
            get()
        }
        nonmutating set {
            set(newValue)
        }
    }
}

extension StringProtocol {
    
    var uppercasingFirst: String { prefix(1).uppercased() + dropFirst() }
    var lowercasingFirst: String { prefix(1).lowercased() + dropFirst() }
    
    func toCamelCase() -> String {
        guard !isEmpty else { return ""}
        
        let parts = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        
        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})
        
        return ([first] + rest).joined(separator: "")
    }
    
    func toSnakeCase() -> String {
        guard !isEmpty else { return ""}
        
        let parts = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        
        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).lowercasingFirst})
        
        return ([first] + rest).joined(separator: "_").lowercased()
    }
    
    func toKebabCase() -> String {
        guard !isEmpty else { return ""}
        
        let parts = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        
        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).lowercasingFirst})
        
        return ([first] + rest).joined(separator: "-").lowercased()
    }
}
