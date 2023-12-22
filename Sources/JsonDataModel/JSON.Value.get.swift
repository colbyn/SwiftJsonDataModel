//
//  File.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation

extension JSON.Value {
    public subscript(key: String) -> JSON.Value? {
        switch self {
        case .object(let object): return object[key]
        default: return nil
        }
    }
    public subscript(index: Int) -> JSON.Value? {
        switch self {
        case .array(let array): return array[index]
        default: return nil
        }
    }
}
