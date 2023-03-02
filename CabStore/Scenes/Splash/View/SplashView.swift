//
//  SplashView.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import UIKit

class SplashView: UIView {

    func setupUI(){
        self.backgroundColor = .white
        createImageBanner()
        createImageShoppingBag()
    }
    func createImageBanner() {
        let imageBanner = UIImageView()
        let image = UIImage.init(named: "cabifyLogo")
        imageBanner.image = image
        self.addSubview(imageBanner)
        imageBanner.snp.makeConstraints { make in
            make.top.equalTo(200)
            make.height.equalTo(50)
            make.width.equalTo(140)
            make.centerX.equalToSuperview()
        }
        imageBanner.contentMode = .scaleAspectFit
    }
    func createImageShoppingBag() {
        let imageBanner = UIImageView()
        let image = UIImage.init(named: "shoppingBag")
        imageBanner.image = image
        self.addSubview(imageBanner)
        imageBanner.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.centerX.centerY.equalToSuperview()
        }
        imageBanner.contentMode = .scaleAspectFit
    }

}
