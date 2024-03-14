//
//  ErrorHandlerView.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 12/03/2024.
//

import UIKit

enum ErrorViewType {
    case noData
    case noInternet
    case serverError
}

protocol ErrorHandlerViewDelegate {
    func didTapRetry(errorViewType : ErrorViewType)
}
class ErrorHandlerView: BaseView {

    @IBOutlet weak var imgEmpty: UIImageView!
    @IBOutlet weak var lblEmptyTitle: UILabel!
    @IBOutlet weak var btnRetry: UIButton!
    
    var errorViewType : ErrorViewType?
    var delegate : ErrorHandlerViewDelegate?
    override func setupUI() {
        super.setupUI()
        self.backgroundColor = .clear
        lblEmptyTitle.font = UIFont.systemFont(ofSize: 15)
        
        btnRetry.setTitle("Retry", for: .normal)
        btnRetry.setTitleColor(.white, for: .normal)
        btnRetry.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnRetry.backgroundColor = UIColor(named: "colorPrimary")
        
        lblEmptyTitle.textColor = .darkGray
        lblEmptyTitle.text = "No Data Available"
    }
    
    override func bindData() {
        super.bindData()
        
        btnRetry.rx.tap.bind {[unowned self] in
            if let errorViewType = errorViewType {
                delegate?.didTapRetry(errorViewType: errorViewType)
            }
        }.disposed(by: disposableBag)
    }
    
    func setupView(errorViewType : ErrorViewType) {
        self.errorViewType = errorViewType
        switch errorViewType {
        case .noData:
            lblEmptyTitle.isHidden = false
            imgEmpty.tintColor = .lightGray
            imgEmpty.image = UIImage(named: "no_data")
            btnRetry.isHidden = true
        case .noInternet:
            lblEmptyTitle.isHidden = true
            imgEmpty.image = UIImage(named: "ic_noInternet")
            btnRetry.isHidden = false
        case .serverError:
            lblEmptyTitle.isHidden = true
            imgEmpty.image = UIImage(named: "ic_serverError")
            btnRetry.isHidden = false
        }
    }

}
