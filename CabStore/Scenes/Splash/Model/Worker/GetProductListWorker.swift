//
//  GetProductListWorker.swift
//  CabStore
//
//  Created by Raul on 2/03/23.
//
import Foundation
import UIKit
typealias ProductListUI = [ProductModel]
protocol GetStackExchangeWorkerProtocol {
    func getAuthToken(_ handler: @escaping (ProductListUI?, MessageError?) -> Void )
}
class GetProductListWorker: GetStackExchangeWorkerProtocol {
    let api: StackExchangeAPIProtocol
    var reachability: ReachabilityCheckingProtocol
    let maxNumberOfAttempts = 3
    var currentNumberOfAttempts = 0
    init(
        _ api: StackExchangeAPIProtocol = ProductsAPI(),
        _ reachability: ReachabilityCheckingProtocol = Reachability()
    ) {
        self.api = api
        self.reachability = reachability
    }
    func getAuthToken(_ handler: @escaping (ProductListUI?, MessageError?) -> Void ) {
        guard reachability.isConnectedToNetwork() && currentNumberOfAttempts != maxNumberOfAttempts else {
            handler(nil, nil)
            return
        }
        currentNumberOfAttempts += 1
        api.getAuthToken(handler: { products, error in
            if let error = error {
                debugPrint(error)
                self.getAuthToken(handler)
                let messageError = MessageError(serverError: error)
                handler(nil,messageError)
            }
            guard let productList = products else {
                return
            }
            var productListUI = productList.map({ $0.toProductModel() })
            handler(productListUI, nil)
        })
    }
}
