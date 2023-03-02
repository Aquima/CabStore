//
//  SplashViewController.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import UIKit
import SnapKit

protocol SplashViewDelegate: AnyObject {
    func goToStore()
}
class SplashViewController: UIViewController {
    weak var delegate: SplashViewDelegate?
    static let identifier = "splashViewController"
    private let splashView = SplashView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
    }
    func setupView(){
        self.view = splashView
        splashView.setupUI()
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
