//
//  SplashView.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import UIKit
import PunaUI

class SplashView: UIView {
    private(set) var snackBar: PunaSnackbar?
    func setupUI() {
        self.backgroundColor = .white
        self.addSubview(firstProgressBar)
        firstProgressBar.snp.makeConstraints { make in
            make.top.equalTo(570)
            make.width.equalTo(240)
            make.height.equalTo(5)
            make.centerX.equalToSuperview()
        }
        stackView()
    }
    let firstProgressBar: LinearProgressBar = {
        let progressBar = LinearProgressBar()
        progressBar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        progressBar.progressBarColor = #colorLiteral(red: 0.2661914229, green: 0.1873007119, blue: 0.4777578115, alpha: 1)
        progressBar.progressBarWidth = 4
        progressBar.cornerRadius = 2
        return progressBar
    }()
    func startAnimating() {
        [firstProgressBar].forEach {
            $0.startAnimating()
        }
    }
    func stopAnimating() {
        [firstProgressBar].forEach {
            $0.stopAnimating()
        }
    }
    func createImageBanner() -> UIImageView {
        let imageBanner = UIImageView()
        let image = Asset.SplashView.cabifyLogo.image
        imageBanner.image = image
        imageBanner.frame = CGRect(x: 0, y: 0, width: 200.0, height: 80.0)
        imageBanner.contentMode = .scaleAspectFit
        return imageBanner
    }
    func createImageShoppingBag() -> UIImageView {
        let imageBanner = UIImageView()
        let image = Asset.SplashView.shoppingBag.image
        imageBanner.image = image
        imageBanner.frame = CGRect(x: 0, y: 0, width: 200.0, height: 200.0)
        imageBanner.contentMode = .scaleAspectFit
        return imageBanner
    }
    func stackView() {

        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 0.0

        stackView.addArrangedSubview(createImageShoppingBag())
        stackView.addArrangedSubview(createImageBanner())
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(280)
            make.centerX.centerY.equalToSuperview()
        }
        createButton()
    }
    func createButton() {
        let icon = PunaUIAssets.punaNavegacionCarritoIdle24.image
        let button = PunaButton(text: "Add To Cart",
                                hierarchy: .loud,
                                size: .large,
                                icon: PunaButtonIcon(icon: icon, orientation: .left))
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.bottom.equalTo(-60)
        }
    }
    func createSnackBar() {
        if snackBar == nil {
            snackBar = PunaSnackbar()
        }
        guard let snackBar = self.snackBar else {
            return
        }
        snackBar.duration = .short
        snackBar.type = .error
        snackBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalTo(-60)
        }
        snackBar.isHidden = true
    }
    func show(title: String, message: String) {
        guard let snackBar = self.snackBar else {
            return
        }
        snackBar.text = "\(title) \n \(message)"
        snackBar.isHidden = false
    }
}
