//
//  BaseViewController.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 25/02/2024.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    var disposableBag = DisposeBag()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        bindData()
    }
    

    func setupUI() {
        
    }
    
    func bindData() {
        
    }

}

// MARK: - Route
extension BaseViewController {
    
    func pushVCWithAnimation(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func hideTabBarAndPushVC(_ vc: UIViewController) {
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Loading & Alert
extension BaseViewController {
    func showLoading() {
        LoadingIndicator.shared.startLoading()
    }
    
    func hideLoading() {
        LoadingIndicator.shared.stopLoading()
    }
    
    func showAlert(title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title, style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
