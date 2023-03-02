//
//  SplashCoordinator.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import Foundation
import UIKit

class SplashCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var splashViewController: SplashViewController?
    static let storyboardName = "Main"
//    private var operationCoordinator: OperationCoordinator!
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    func start() {

        let splashViewController = SplashViewController()
        splashViewController.delegate = self
        presenter.pushViewController(splashViewController, animated: false)
        self.splashViewController = splashViewController
     
    }
}
extension SplashCoordinator: SplashViewDelegate {

    func goToStore() {
//        let coordinator = OperationCoordinator(presenter: presenter)
//        coordinator.start()
//        self.operationCoordinator = coordinator
    }
}
