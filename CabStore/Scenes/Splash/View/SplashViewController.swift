//
//  SplashViewController.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import UIKit
import SnapKit
import PunaUI
import Reachability

protocol SplashDisplayLogic: AnyObject {
    var interactor: SplashInteractor { get }
    var presenter: SplashPresenter { get }
}
protocol ListProductsDisplayLogic: AnyObject {
    func displayFetchedProducts(viewModel: ListProducts.Products.ViewModel)
    func displayError(error: MessageError)
}
class SplashViewController: UIViewController, ListProductsDisplayLogic, SplashDisplayLogic, ConnectionListener {

    static let identifier = "splashViewController"
    private let splashView = SplashView()
    var coordinator: ListProductsCoordinatorLogic?
    var interactor: SplashInteractor
    var presenter: SplashPresenter

    let snackBar = PunaSnackbar()
    let rechabilityManager = ReachabilityManager.shared

    init(_ interactor: SplashInteractor,
         _ presenter: SplashPresenter) {
        self.interactor = interactor
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = self
        presenter.viewController = viewController
        interactor.presenter = presenter
        setupView()
    }
    func setupView() {
        self.view = splashView
        splashView.setupUI()
        splashView.startAnimating()
    }
    func fetchProducts() {
        let request = ListProducts.Products.Request()
        interactor.fetchListProducts(request: request)
    }
    // MARK: ListProductsDisplayLogic
    func displayFetchedProducts(viewModel: ListProducts.Products.ViewModel) {
        rechabilityManager.stopMonitoring()
        splashView.stopAnimating()
        coordinator?.goToStore(products: viewModel.displayedProducts)
    }
    func displayError(error: MessageError) {
        self.view.addSubview(snackBar)
        let listener: ConnectionListener = self
        rechabilityManager.addListener(listener: listener)
        createSnackBar(error)
    }
    // MARK: View lifecycle
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      fetchProducts()
    }
    func createSnackBar(_ error: MessageError) {
        snackBar.text = "\(error.title) \n \(error.message)"
        snackBar.duration = .short
        snackBar.type = .error
        snackBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalTo(-60)
        }

        rechabilityManager.startMonitoring()
    }
    // MARK: ConnectionListener
    func connectionChanged(status: Reachability.Connection) {
        if status == .cellular || status == .wifi {
            fetchProducts()
        }
    }
}
