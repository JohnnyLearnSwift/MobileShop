//
//  DataFetcherService.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import Foundation

class DataFetcherService {
    var networkDataFetcher = NetworkDataFetcher()
    
    func fetchPhones(completion: @escaping (Phones?, Phones.Type) -> Void) {
        let url = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        networkDataFetcher.fetchJSONData(urlString: url, response: completion)
    }
}
