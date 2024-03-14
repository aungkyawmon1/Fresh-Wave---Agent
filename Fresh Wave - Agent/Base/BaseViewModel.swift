//
//  BaseViewModel.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 25/02/2024.
//

import Foundation
import RxSwift
import RxRelay

class BaseViewModel {
    let disposableBag = DisposeBag()
    
    let loadingPublishRelay = PublishRelay<Bool>()
    let isNoInternetPublishRelay = PublishRelay<Bool?>()
    var errorObservable = BehaviorRelay<Error?>(value: nil)
    let isServerErrorPublishRelay = PublishRelay<Bool?>()
    
    private var viewController : BaseViewController?
    
    func bindViewModel(in viewController: BaseViewController? = nil) {
        self.viewController = viewController
        
        
        loadingPublishRelay.subscribe {
            if $0 {
                viewController?.showLoading()
            } else {
                viewController?.hideLoading()
            }
        }.disposed(by: disposableBag)
        
        isNoInternetPublishRelay.subscribe( onNext: { [weak self] state in
            guard let self = self, let isNoInternet = state else { return }
            //print("Is no internet" , $0)
            if isNoInternet {
                self.viewController?.view.subviews.forEach{$0.isHidden = true}
                self.viewController?.isShowEmptyView(isShow: true, errorViewType: .noInternet)
            }
            else {
                self.viewController?.view.subviews.forEach{$0.isHidden = false}
            }
            
        }).disposed(by: disposableBag)
        
        errorObservable.subscribe(onNext: { (error) in
            
            viewController?.hideLoading()
            
            if let error = error as? ApiError {
                switch error {
                    
                case .noConnection:
                    self.isNoInternetPublishRelay.accept(true)
                case .sessionExpired:
                    self.viewController?.showMessage("Session Expired!")
                case .unauthorized:
                    self.viewController?.showMessage("Unauthorized!")
                case .decodingError(_):
                    self.viewController?.showMessage("Decoding Error!")
                case .serverError(_):
                    self.viewController?.showMessage("Server Error!")
                case .requestTimeOut:
                    self.viewController?.showMessage("Request Time Out!")
                case .requestCancel:
                    self.viewController?.showMessage("Request Error!")
                case .validationError(_):
                    self.viewController?.showMessage("Validation Error!")
                }
            }
            
        }).disposed(by: disposableBag)
        
        isServerErrorPublishRelay.bind {
            //print("Is server error " , $0)
            if let isServerError = $0 ,
               isServerError{
                self.viewController?.view.subviews.forEach{$0.isHidden = true}
                self.viewController?.isShowEmptyView(isShow: true, errorViewType: .serverError)
            }
            else {
                self.viewController?.view.subviews.forEach{$0.isHidden = false}
            }
        }.disposed(by: disposableBag)
    }
}
