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
    var baseViewModel = BaseViewModel()
    var emptyView : ErrorHandlerView?
    
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
    
    func retry() {
        
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


extension BaseViewController {
    func isShowEmptyView(isShow : Bool , errorViewType : ErrorViewType = .noData) {
        if let emptyView = emptyView {
            emptyView.removeFromSuperview()
        }
        
        if isShow {
            emptyView = ErrorHandlerView(frame: CGRect.zero)
            guard let emptyView = emptyView else { return }
            emptyView.setupView(errorViewType: errorViewType)
            emptyView.backgroundColor = .clear
            emptyView.delegate = self
            self.view.addSubview(emptyView)
            emptyView.bringSubviewToFront(self.view)
            
            NSLayoutConstraint.activate([
                emptyView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                emptyView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                emptyView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                emptyView.heightAnchor.constraint(equalToConstant: 250)
            ])
        }
        
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
    
    func showMessage(_ message: String, isSuccessfulState: Bool = false) {
        ToastView.show(message, isSuccessfulState: isSuccessfulState)
    }
}

extension BaseViewController : ErrorHandlerViewDelegate {
    func didTapRetry(errorViewType: ErrorViewType) {
        self.view.subviews.forEach{$0.isHidden = false}
        baseViewModel.isNoInternetPublishRelay.accept(false)
        baseViewModel.isServerErrorPublishRelay.accept(false)
        self.isShowEmptyView(isShow: false, errorViewType: errorViewType)
        retry()
    }
}
