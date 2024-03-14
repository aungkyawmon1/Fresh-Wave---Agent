//
//  LoginModel.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 12/03/2024.
//

import Foundation
import RxSwift

protocol AuthModel {
    
    func login(body: RequestBody) -> Observable<LoginResponse>
    
}

class AuthModelImpl: BaseModel, AuthModel {
    
    static let shared = AuthModelImpl()
    
    private override init() {}
    
    func login(body: RequestBody) -> Observable<LoginResponse> {
        service.request(endpoint: .login(body), response: LoginResponse.self)
    }
    
}
