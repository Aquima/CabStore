//
//  Coordinator.swift
//  CabStore
//
//  Created by Raul Quispe on 27/11/21.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get set }
//    var children: [Coordinator] { get set }
    func start()
}
