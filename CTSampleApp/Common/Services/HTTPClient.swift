//
//  HTTPClient.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class HTTPClient: IConnection {
    
    private let baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }
 
    private func createFullURL(endPoint: String) -> URL {
        return self.baseURL.appendingPathComponent(endPoint)
    }

    override func sendRequest(_ iRequest: IRequest, callback: @escaping RequestCallback) {
        
        let url = createFullURL(endPoint: iRequest.apiEndpoint())
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = iRequest.methodType().rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (result) in
            switch result {
            case .success(( _, let data)):
                callback(data, nil)
                break
            case .failure(let error):
                print("Error: \(String(describing: error))")
                callback(nil, error)
                break
            }
        }
        dataTask.resume()
    }
}

extension URLSession {
    func dataTask(with request: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: request) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
