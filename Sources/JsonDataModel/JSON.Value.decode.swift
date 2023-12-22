//
//  File.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation

extension JSON.Value {
    public func decode<DataModel: Decodable>(as model: DataModel.Type) throws -> DataModel? {
        let decoder = JSONDecoder()
        let string = self.stringify()
        return try decoder.decode(model, from: string.data(using: string.fastestEncoding)!)
    }
}
