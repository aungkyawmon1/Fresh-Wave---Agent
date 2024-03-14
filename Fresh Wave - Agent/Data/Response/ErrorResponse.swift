//
//  ErrorResponse.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 07/03/2024.
//

import Foundation

struct ErrorResponse: Codable {
    var error: String?
    var phone: [String]?
    var message: String?
}
