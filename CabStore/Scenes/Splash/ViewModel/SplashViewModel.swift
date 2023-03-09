//
//  SplashViewModel.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import Foundation

protocol ListProductDisplayLogic: AnyObject
{
    func displayProducts(viewModel: ListProducts.Products.ViewModel)
}
class SplashViewModel {
    weak var viewController: ProductsListLogic?
}

enum ListProducts
{
    // MARK: Use cases
    
    enum Products {
        struct Request {
            
        }
        struct Response {
            var orders: [Product]
        }
        class ViewModel {
            var displayedProducts: [ProductModel] = []
            func loadProductsList() {
                let worker = GetProductListWorker()
                worker.getAuthToken({ productsList, error in
                    guard let productsListUI = productsList else {
                        return
                    }
                    self.displayedProducts = productsListUI
                })
            }
        }
    }
}
struct CabifyStore: Codable {
    var products: [Product]
}
