//
//  ProfileVC.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 22/02/2024.
//

import UIKit

class ProfileVC: BaseViewController {

    private let viewModel: ProfileViewModel
    
    required init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    override func setupUI() {
        title = "Profile"
    }
    
    

}
