//
//  SplashPresenter.swift
//  CabStore
//
//  Created by Raul on 10/03/23.
//

import UIKit
protocol ListProductsPresentationLogic {
    func presentListProducts(response: ListProducts.Products.Response)
}
protocol ShowAlertPresentationLogic {
    func presentError(error: MessageError)
}
class SplashPresenter: ListProductsPresentationLogic, ShowAlertPresentationLogic {
    weak var viewController: ListProductsDisplayLogic?
    func presentListProducts(response: ListProducts.Products.Response) {
        var displayedProducts: [ListProducts.Products.ViewModel.ProductModel] = []
        displayedProducts = response.products.map({ $0.toProductModel() })
        let viewModel = ListProducts.Products.ViewModel(displayedProducts: displayedProducts)
        viewController?.displayFetchedProducts(viewModel: viewModel)
    }
    func presentError(error: MessageError) {
        viewController?.displayError(error: error)
    }
}
