//
//  KeychainManager.swift
//  SwiftKeychainWrapper
//
//  Created by Gurunath Sripad on 4/9/22.
//

import Foundation

class KeychainManager {
    static func save ( service: String, account:String, password:Data) throws{
        let query:[String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: password as AnyObject
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateEntry
        }
        guard status == errSecSuccess else {
            throw KeychainError.unknownError(status)
        }
        print("data was saved successfully")
    }
    
    static func get(service:String, account:String) throws -> Data? {
        let query :[String:AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecClass as String: kSecClassGenericPassword as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne as AnyObject
        ]
        var result:AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        guard status == errSecSuccess  else {
            throw KeychainError.unknownError(status)
        }
        return result as? Data
    }
}
