//
//  HomeVC.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 22/02/2024.
//

import UIKit

class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // code to execute after specified delay
            self.hideLoading()
        }
    }

}
