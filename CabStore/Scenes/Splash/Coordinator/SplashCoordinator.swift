//
//  SplashCoordinator.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import Foundation
import UIKit
protocol ListProductsCoordinatorLogic: AnyObject {
    func goToStore(products: [ListProducts.Products.ViewModel.ProductModel])
}
class SplashCoordinator: Coordinator {
    var navigation: UINavigationController
    private weak var splashViewController: SplashViewController?
    static let storyboardName = "Main"

    init(_ navigation: UINavigationController) {
        self.navigation = navigation
    }
    func start() {
        let interactor = SplashInteractor()
        let presenter = SplashPresenter()
        let splashViewController = SplashViewController(interactor,
                                                        presenter)
        splashViewController.coordinator = self
        navigation.pushViewController(splashViewController, animated: false)
        self.splashViewController = splashViewController
    }
}
extension SplashCoordinator: ListProductsCoordinatorLogic {

    func goToStore(products: [ListProducts.Products.ViewModel.ProductModel]) {
        let coordinator = StoreCoordinator(navigation, products)
        coordinator.start()
    }
}
