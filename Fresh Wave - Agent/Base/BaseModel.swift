//
//  BaseModel.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 12/03/2024.
//

import Foundation
import Alamofire

class BaseModel {
    
    let service = ApiService.shared
    
    private var requests: [Request] = []
    
    func cancel() {
        requests.forEach { $0.cancel() }
    }
    
    deinit {
        print("Deinit: - " + String(describing: self))
    }
}
