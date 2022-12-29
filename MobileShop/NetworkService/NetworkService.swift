//
//  NetworkService.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
    func createDataTask(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask
}

class NetworkService: NetworkServiceProtocol {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(request: request, completion: completion)
        task.resume()
    }
    
    internal func createDataTask(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
}
