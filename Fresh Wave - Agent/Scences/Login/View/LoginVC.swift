//
//  LoginVC.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 22/02/2024.
//

import UIKit

class LoginVC: BaseViewController {
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func bindData() {
        txtFieldEmail.rx.text.map { $0 ?? ""}.bind(to: viewModel.emailSubject ).disposed(by: disposableBag)
        
        txtFieldPassword.rx.text.map { $0 ?? ""}.bind(to: viewModel.passwordSubject ).disposed(by: disposableBag)
        
        // Bind button isEnabled property to ViewModel's isValid
        viewModel.isValid.bind(to: btnLogin.rx.isEnabled ).disposed(by: disposableBag )
        viewModel.isValid.map { $0 ? 1.0 : 0.5 }.bind(to: btnLogin.rx.alpha).disposed(by: disposableBag)
                
        
        btnLogin.rx.tap.bind { [unowned self] in
            guard let email = txtFieldEmail.text, let password = txtFieldPassword.text else { return }
            viewModel.loginAgent(email, password)
        }.disposed(by: disposableBag)
        
        viewModel.loginResponse.subscribe( onNext: { [weak self] response in
            guard let self = self, let _ = response else { return }
            self.showMessage("Success")
        }).disposed(by: disposableBag)
    }

}
