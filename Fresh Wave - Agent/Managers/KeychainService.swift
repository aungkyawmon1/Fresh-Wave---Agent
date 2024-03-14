//
//  KeychainService.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 12/03/2024.
//

import Foundation
import KeychainAccess

class KeychainService {
    
    static let shared = KeychainService()
    private init() {}
    
    private let keychain = Keychain()
    
    func saveAccessToken(_ token: String) {
        do {
            try keychain.set(token, key: "access_token")
        } catch let error {
            print("KeychainSaveError:- Access Token, error:- \(error).")
        }
    }
    
    func getAccessToken() -> String? {
        do {
            return try keychain.getString("access_token")
        } catch let error {
            print("KeychainGetError:- Access Token, error:- \(error).")
            return nil
        }
    }
    
    func saveString(value: String, key: String) {
        do {
            try keychain.set(value, key: key)
        } catch let error {
            print("KeychainSaveError:- with key \(key), error:- \(error).")
        }
    }
}
