//
//  StoreCoordinator.swift
//  CabStore
//
//  Created by Raul on 12/03/23.
//

import Foundation
import UIKit

protocol ShowCoordinatorLogic: AnyObject {
    func showStore(product: DisplayProduct)
}
class StoreCoordinator: Coordinator {
    var navigation: UINavigationController
    private weak var storeViewController: StoreViewController?
    static let storyboardName = "Main"
    private var products: DisplayProducts
    init(_ navigation: UINavigationController,
         _ products: [ListProducts.Products.ViewModel.ProductModel]) {
        self.navigation = navigation
        self.products = products
    }
    func start() {
        let interactor = StoreInteractor(products)
        let presenter = StorePresenter()
        let storeViewController = StoreViewController(interactor,
                                                        presenter)
        storeViewController.coordinator = self
        navigation.pushViewController(storeViewController, animated: false)
        self.storeViewController = storeViewController
    }
}
extension StoreCoordinator: ShowCoordinatorLogic {

    func showStore(product: DisplayProduct ) {
//        let coordinator = OperationCoordinator(presenter: presenter)
//        coordinator.start()
//        self.operationCoordinator = coordinator
    }
}
