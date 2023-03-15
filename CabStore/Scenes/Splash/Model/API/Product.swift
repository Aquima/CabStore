//
//  Product.swift
//  CabStore
//
//  Created by Raul on 2/03/23.
//

import UIKit

struct Product: Codable {
    let code, name: String
    let price: Double
}
extension Product {
    func toProductModel() -> ListProducts.Products.ViewModel.ProductModel {
        let productModel = ListProducts.Products.ViewModel.ProductModel(title: self.code,
                                        identifier: self.code,
                                        price: self.price)
        return productModel
    }
}
