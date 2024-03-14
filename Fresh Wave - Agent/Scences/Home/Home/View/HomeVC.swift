//
//  HomeVC.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 22/02/2024.
//

import UIKit

class HomeVC: BaseViewController {
    
    @IBOutlet weak var orderState: UISegmentedControl!
    @IBOutlet weak var orderTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableViewCells()
    }
    
    override func setupUI() {
        title = "Home"
    }
    private func setupTableViewCells() {
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.registerCell(from: OrderTableViewCell.self)
    }

    @IBAction func statusChange(_ sender: UISegmentedControl) {
    }
    
    //MARK: - Route
    func navigateToOrderDetail() {
        let vc = OrderDetailVC()
        
        hideTabBarAndPushVC(vc)
        
    }
}


extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToOrderDetail()
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(from: OrderTableViewCell.self, at: indexPath)
        return cell
    }
    
}
