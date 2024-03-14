//
//  LaunchVC.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 14/03/2024.
//

import UIKit

class LaunchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 1) {
        } completion: { _ in
            AppCoordinator.shared.reroute()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
