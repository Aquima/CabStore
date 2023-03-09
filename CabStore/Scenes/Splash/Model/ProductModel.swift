//
//  ProductModel.swift
//  CabStore
//
//  Created by Raul on 2/03/23.
//

import UIKit

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
            break
        case .tshirt:
            urlString = "https://goofy-shannon-8fec5b.netlify.com/tshirt.jpg"
            break
        case .voucher:
            urlString = "https://goofy-shannon-8fec5b.netlify.com/voucher.jpg"
            break
        }
        let urlTemp = URL(string: urlString)!
        url = urlTemp
        return url
    }
}
enum Category: String {
    case voucher = "VOUCHER"
    case tshirt = "TSHIRT"
    case mug = "MUG"
}
