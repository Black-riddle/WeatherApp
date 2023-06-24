//
//  JsonDecodeExtension.swift
//  Weather-Kit
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import Combine

// MARK: - JSONDecoder Extension
extension JSONDecoder {

    func decodeResponse<T: Codable>(from responseData: Data?, error: Error?) -> Result<T, Error> {
        guard let responseData = responseData, error == nil else {
            return  .failure(error!)
        }
        return self.parseData(data: responseData, error: error)
    }

    func parseData<T: Codable>(data: Data, error: Error?) -> Result<T, Error> {
        do {
            let item =  try self.decode(T.self, from: data)
            return .success(item)
            
        } catch {
            do {
                let item = try self.decode(WError.self, from: data)
                return .failure(item)
            } catch {
                return .failure(error)
            }
        }
    }
}




