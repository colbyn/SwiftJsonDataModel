//
//  JSON.Value.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation

extension JSON {
    /// The JSON Data Model
    ///
    /// This represents a JSON value.
    public enum Value {
        case null
        case string(String)
        case number(Number)
        case bool(Bool)
        case array(Array)
        case object(Object)
        public typealias Object = Dictionary<Swift.String, JSON.Value>
        public typealias Array = [JSON.Value]
        public typealias Number = NSNumber
        public typealias String = Swift.String
        public typealias Bool = Swift.Bool
    }
}
