//
//  AplicationCoordinator.swift
//  BCPChallenge
//
//  Created by Raul Quispe on 27/11/21.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow?
    let rootViewController: UINavigationController
    var homeCoordinator: SplashCoordinator
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.isHidden = true
        homeCoordinator = SplashCoordinator(presenter: rootViewController)
    }
    func start() {
        window?.rootViewController = rootViewController
        homeCoordinator.start()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
