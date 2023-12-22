//
//  JSON.Value.utils.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation

extension JSON.Value {
    public var asArray: JSON.Value.Array? {
        switch self {
        case .array(let array): return array
        default: return nil
        }
    }
    public var asString: JSON.Value.String? {
        switch self {
        case .string(let string): return string
        default: return nil
        }
    }
    public var asNumber: JSON.Value.Number? {
        switch self {
        case .number(let number): return number
        default: return nil
        }
    }
    public var asBool: JSON.Value.Bool? {
        switch self {
        case .bool(let bool): return bool
        default: return nil
        }
    }
    public var asObject: JSON.Value.Object? {
        switch self {
        case .object(let object): return object
        default: return nil
        }
    }
}
