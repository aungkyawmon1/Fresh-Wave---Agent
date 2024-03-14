//
//  API.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 07/03/2024.
//

import Foundation

/// Define constants especially for network service.
class Api {
    
    /// Computed property that return baseURL from Bundle after decrypted
    static var baseUrl: String {
        return "http://54.169.160.194/api/auth/"
    }
    
    
      /// Computed property that return appToken from Bundle after decrypted
      static var appToken: String {
          return ""
      }
    
}
