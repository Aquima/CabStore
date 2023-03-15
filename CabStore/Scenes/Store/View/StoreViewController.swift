//
//  StoreViewController.swift
//  CabStore
//
//  Created by Raul on 12/03/23.
//

import UIKit
protocol StoreDisplayLogic: AnyObject {
    var interactor: StoreInteractor { get }
    var presenter: StorePresenter { get }
    func displayStore(_ products: [ListProducts.Products.ViewModel.ProductModel])
}
class StoreViewController: UIViewController, StoreDisplayLogic {
    var interactor: StoreInteractor
    var presenter: StorePresenter
    var coordinator: StoreCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    init(_ interactor: StoreInteractor,
         _ presenter: StorePresenter) {
        self.interactor = interactor
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - StoreDisplayLogic
    func displayStore(_ products: [ListProducts.Products.ViewModel.ProductModel]) {
        
    }
}
