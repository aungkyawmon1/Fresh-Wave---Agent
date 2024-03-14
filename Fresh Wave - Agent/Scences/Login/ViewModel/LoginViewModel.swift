//
//  LoginViewModel.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 13/03/2024.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: BaseViewModel {
    private let authModel: AuthModel
    
    let loginResponse = BehaviorRelay<LoginResponse?>(value: nil)
    let emailSubject = PublishSubject<String>()
    let passwordSubject = PublishSubject<String>()
    
    init(authModel: AuthModel) {
        self.authModel = authModel
    }
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailSubject, passwordSubject)
            .map { email, password in
                return self.isValidEmail(email) && self.isValidPassword(password)
                }

    }
    
    func loginAgent(_ userName: String, _ password: String) {
        let body: RequestBody = [ "username": userName, "password": password]
        
        loadingPublishRelay.accept(true)
        authModel.login(body: body).subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.loadingPublishRelay.accept(false)
            self.manageTokenResponse(data)
            
            self.loginResponse.accept(data)
           
        },onError: { [weak self] error in
            guard let self = self else { return }
            self.loadingPublishRelay.accept(false)
            self.errorObservable.accept(error)
        }).disposed(by: disposableBag)
    }
    
    private func manageTokenResponse(_ response: LoginResponse) {
        KeychainService.shared.saveAccessToken(response.accessToken ?? "")
        Preference.setValue(true, forKey: .isAuth)
        guard let agentVO = response.user else { return }
        Preference.saveAgentInfo(agentVO)
    }
    
    
    private func isValidEmail(_ email: String) -> Bool {
          // Perform email validation logic here
          return email.contains("@") && email.contains(".")
      }
      
      private func isValidPassword(_ password: String) -> Bool {
          // Perform password validation logic here
          return password.count >= 6 // Example: password should be at least 6 characters long
      }
       
}
