//
//  JSON.Value.parse.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation

extension JSON.Value {
    public static func parse(source: String) throws -> Self {
        let data = source.data(using: source.fastestEncoding)!
        let value = try JSONSerialization.jsonObject(with: data, options: [.json5Allowed])
        return Self.from(any: value)
    }
    public static func parse(source data: Data) throws -> Self {
        let value = try JSONSerialization.jsonObject(with: data, options: [.json5Allowed])
        return Self.from(any: value)
    }
    public static func parse(data: Data) throws -> Self {
        let value = try JSONSerialization.jsonObject(with: data, options: [.json5Allowed])
        return Self.from(any: value)
    }
     public static func parse(read url: URL) throws -> Self {
         let data = try Data(contentsOf: url)
         return try Self.parse(data: data)
     }
}

extension JSON.Value {
    public static func from(any value: Any) -> Self {
        if let value = value as? [String: Any] {
            let value = value.map { key, value in (key, JSON.Value.from(any: value)) }
            return JSON.Value.object(JSON.Value.Object(uniqueKeysWithValues: value))
        }
        if let value = value as? [Any] {
            return JSON.Value.array(value.map { JSON.Value.from(any: $0) })
        }
        if let value = value as? String {
            return JSON.Value.string(value)
        }
        if let value = value as? NSNumber {
            return JSON.Value.number(value)
        }
        if let value = value as? Bool {
            return JSON.Value.bool(value)
        }
        return JSON.Value.null
    }
}
