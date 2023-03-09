//
//  ProductsAPI.swift
//  CabStore
//
//  Created by Raul on 2/03/23.
//

import Alamofire
import Foundation

typealias Products = [Product]
protocol StackExchangeAPIProtocol {
    func getAuthToken(handler: @escaping (Products?, ServerError?) -> Void )
}
class ProductsAPI: StackExchangeAPIProtocol {
    
    func getAuthToken(handler: @escaping (Products?, ServerError?) -> Void) {
        let queue = DispatchQueue(label: "com.queue.concurrent",
                                  qos: .userInteractive,
                                  attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 1)
        queue.async {
            let apiManager = CabifyApiManager.shared.sessionManager
            let urlRequest = URL(string: Configuration.urlStackExchange)!
            apiManager.request(urlRequest,
                               method: .get)
                .validate(statusCode: 200...299)
                .responseDecodable(of: Products.self,
                                   queue: queue){ response in
                    guard let stackExchange = response.value else {
                        semaphore.signal()
                        DispatchQueue.main.async {
                            let code = response.response?.statusCode
                            if code == 401 {
                                let serverError = ServerError(rawValue: code!)
                                handler(nil,serverError)
                            }
                        }
                        return
                    }
                    semaphore.signal()
                    DispatchQueue.main.async {
                        handler(stackExchange,nil)
                    }
                  
                }
            semaphore.wait()
        }
    }
}



