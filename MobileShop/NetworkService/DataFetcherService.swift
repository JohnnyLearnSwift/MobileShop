//
//  DataFetcherService.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import Foundation

protocol DataFetcherServiceProtocol {
    var networkDataFetcher: NetworkDataFetcherProtocol { get }
    
    func fetchPhones(completion: @escaping (Phones?) -> Void)
    func fetchPhoneProperties(completion: @escaping (PhoneProperties?) -> Void)
    func fetchCart(completion: @escaping (Cart?) -> Void)
}

class DataFetcherService: DataFetcherServiceProtocol {
    internal var networkDataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher()
    
    
    func fetchPhones(completion: @escaping (Phones?) -> Void) {
        let url = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        networkDataFetcher.fetchJSONData(urlString: url, response: completion)
    }
    
    func fetchPhoneProperties(completion: @escaping (PhoneProperties?) -> Void) {
        let url = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        networkDataFetcher.fetchJSONData(urlString: url, response: completion)
    }
    
    func fetchCart(completion: @escaping (Cart?) -> Void) {
        let url = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        networkDataFetcher.fetchJSONData(urlString: url, response: completion)
    }
}
