//
//  GetProductListWorker.swift
//  CabStore
//
//  Created by Raul on 2/03/23.
//
import Foundation
import UIKit

protocol ListProductsWorkerProtocol {
    func getListProductsUI(_ handler: @escaping (Products?, MessageError?) -> Void )
}
class ListProductsWorker: ListProductsWorkerProtocol {
    let api: ProductsAPIProtocol
    var reachability: ReachabilityCheckingProtocol
    let maxNumberOfAttempts = 6
    var currentNumberOfAttempts = 0
    init(
        _ api: ProductsAPIProtocol = ProductsAPI(),
        _ reachability: ReachabilityCheckingProtocol = Reachability()
    ) {
        self.api = api
        self.reachability = reachability
    }
    func getListProductsUI(_ handler: @escaping (Products?, MessageError?) -> Void ) {
        guard reachability.isConnectedToNetwork() && currentNumberOfAttempts != maxNumberOfAttempts else {
            handler(nil, MessageError(serverError: .nointernet))
            self.getListProductsUI(handler)
            return
        }
        currentNumberOfAttempts += 1
        api.getListProducts(handler: { products, error in
            if let error = error {
                debugPrint(error)
                self.getListProductsUI(handler)
                let messageError = MessageError(serverError: error)
                handler(nil,messageError)
            }
            guard let listProducts = products else {
                return
            }
            handler(listProducts, nil)
        })
    }
}
