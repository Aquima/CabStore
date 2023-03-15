//
//  SplashViewModel.swift
//  CabStore
//
//  Created by Raul Quispe on 1/03/23.
//

import Foundation

typealias DisplayProduct = ListProducts.Products.ViewModel.ProductModel
typealias DisplayProducts = [DisplayProduct]

enum ListProducts {
    // MARK: Use cases
    enum Products {
        struct Request {
        }
        struct Response {
            var products: [Product]
        }
        struct ViewModel {
            class ProductModel {
                private(set) var title:String
                private(set) var price:Double
                private(set) var identifier:String
                private(set) var urlImage:URL?
                init(title: String, identifier: String, price: Double) {
                    self.title = title
                    self.identifier = identifier
                    self.price = price
                    guard let category = Category(rawValue: self.identifier) else {
                        return
                    }
                    self.urlImage = self.getUrlImage(category)
                }
                func getUrlImage(_ category: Category) -> URL {
                    var url: URL
                    var urlString: String = String()
                    switch category {
                    case .mug:
                        urlString = "https://goofy-shannon-8fec5b.netlify.com/mug.jpg"
                    case .tshirt:
                        urlString = "https://goofy-shannon-8fec5b.netlify.com/tshirt.jpg"
                    case .voucher:
                        urlString = "https://goofy-shannon-8fec5b.netlify.com/voucher.jpg"
                    }
                    let urlTemp = URL(string: urlString)!
                    url = urlTemp
                    return url
                }
            }
            var displayedProducts: DisplayProducts = DisplayProducts()
        }
    }
}

struct CabifyStore: Codable {
    var products: [Product]
}
