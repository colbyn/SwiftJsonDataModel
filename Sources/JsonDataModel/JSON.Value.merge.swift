//
//  JSON.Value.merge.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation

extension JSON.Value {
    public func merge(with other: Self) -> Self {
        switch self {
        case .null: return other
        case .string(let string1):
            switch other {
            case .null: return self
            case .string(let string2):
                return JSON.Value.string("\(string1)\(string2)")
            case .number:
                return JSON.Value.array([self, other])
            case .bool:
                return JSON.Value.array([self, other])
            case .array(let array2):
                return JSON.Value.array([[self], array2].flatMap { $0 })
            case .object:
                return JSON.Value.array([self, other])
            }
        case .number:
            switch other {
            case .null: return self
            case .string:
                return JSON.Value.array([self, other])
            case .number:
                return JSON.Value.array([self, other])
            case .bool:
                return JSON.Value.array([self, other])
            case .array(let array2):
                return JSON.Value.array([[self], array2].flatMap { $0 })
            case .object:
                return JSON.Value.array([self, other])
            }
        case .bool:
            switch other {
            case .null: return self
            case .string:
                return JSON.Value.array([self, other])
            case .number:
                return JSON.Value.array([self, other])
            case .bool:
                return JSON.Value.array([self, other])
            case .array(let array2):
                return JSON.Value.array([[self], array2].flatMap { $0 })
            case .object:
                return JSON.Value.array([self, other])
            }
        case .array(let array1):
            switch other {
            case .null: return self
            case .string:
                return JSON.Value.array([array1, [other]].flatMap { $0 })
            case .number:
                return JSON.Value.array([array1, [other]].flatMap { $0 })
            case .bool:
                return JSON.Value.array([array1, [other]].flatMap { $0 })
            case .array(let array2):
                return JSON.Value.array([array1, array2].flatMap { $0 })
            case .object:
                return JSON.Value.array([array1, [other]].flatMap { $0 })
            }
        case .object(let object1):
            switch other {
            case .null: return self
            case .string:
                return JSON.Value.array([self, other])
            case .number:
                return JSON.Value.array([self, other])
            case .bool:
                return JSON.Value.array([self, other])
            case .array:
                return JSON.Value.array([self, other])
            case .object(let object2):
                let keys1 = Set(object1.keys)
                let keys2 = Set(object2.keys)
                if keys1.isDisjoint(with: keys2) {
                    
                }
                if keys1.isDisjoint(with: keys2) {
                    
                }
                return JSON.Value.array([self, other])
            }
        }
    }
}
