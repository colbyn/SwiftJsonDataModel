//
//  JSON.Value.stringify.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation

extension JSON.Value {
    public func stringify(outputFormatting: JSONEncoder.OutputFormatting = JSONEncoder.OutputFormatting.prettyPrinted) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let jsonData = try! encoder.encode(self)
        return String(data: jsonData, encoding: .utf8)!
    }
}

extension JSON.Value: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .null:
            try container.encodeNil()
        case .string(let string):
            try container.encode(string)
        case .number(let number):
            try container.encode(number.doubleValue)
        case .bool(let bool):
            try container.encode(bool)
        case .array(let array):
            try container.encode(array)
        case .object(let object):
            try container.encode(object)
        }
    }
}
