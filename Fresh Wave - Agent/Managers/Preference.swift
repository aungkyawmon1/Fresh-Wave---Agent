//
//  Preference.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 12/03/2024.
//

import Foundation


enum PreferenceKeys: String {
    case isSplashed
    case isAuth
    case userInfo
    case isNewUser
}

class Preference {
    
    static func setValue(_ value: Any?, forKey key: PreferenceKeys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    static func getBool(forKey key: PreferenceKeys) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    static func getString(forKey key: PreferenceKeys) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    static func getData(forKey key: PreferenceKeys) -> Data? {
        return UserDefaults.standard.data(forKey: key.rawValue)
    }
    
    static func getDouble(forKey key: PreferenceKeys) -> Double {
        return UserDefaults.standard.double(forKey: key.rawValue)
    }
    
    static func getFloat(forKey key: PreferenceKeys) -> Float? {
        return UserDefaults.standard.float(forKey: key.rawValue)
    }
    
    static func getInteger(forKey key: PreferenceKeys) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    //MARK: - get String array
    static func getStringArray(forKey key: PreferenceKeys) -> [String] {
        return UserDefaults.standard.array(forKey: key.rawValue) as? [String] ?? [String]()
    }
    
}


extension Preference {
    
    // AgentInfo
    static func saveAgentInfo(_ userInfo: AgentVO) {
        do {
            try UserDefaults.standard.setObject(userInfo, forKey: PreferenceKeys.userInfo.rawValue)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func getAgentInfo() -> AgentVO? {
        do {
            return try UserDefaults.standard.getObject(forKey: PreferenceKeys.userInfo.rawValue, castTo: AgentVO.self)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func removeUserInfo() {
        UserDefaults.standard.setValue(nil, forKey: PreferenceKeys.userInfo.rawValue)
    }
    
}
