//
//  NetworkDataFetcher.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import Foundation

class NetworkDataFetcher {
    var networkService = NetworkService()
    
    func fetchJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void) {
        networkService.request(urlString: urlString) { data, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                response(nil)
            }
            
            let decode = self.decodeJSON(type: T.self, data: data)
            response(decode)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
