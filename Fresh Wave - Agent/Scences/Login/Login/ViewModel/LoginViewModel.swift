//
//  LoginViewModel.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 12/03/2024.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: BaseViewModel {
    
    private let authModel: AuthModel
    
    let loginResponse = BehaviorRelay<LoginResponse?>(value: nil)
    var stagingStateFail = BehaviorRelay<Bool>(value: false)
    var phoneSubject = PublishSubject<String>()
    
    init(authModel: AuthModel) {
        self.authModel = authModel
    }
    
   
    func loginAgent(_ name: String, _ password: String) {
        let body: RequestBody = [ "username": name, "password": password]
        authModel.login(body: body).subscribe(onNext: { [weak self] response in
            guard let self = self else { return }
            self.loginResponse.accept(response)
        }, onError: { [weak self] error in
            guard let self = self else { return }
            self.errorObservable.accept(error)
        }).disposed(by: disposableBag)
    }
    
}
