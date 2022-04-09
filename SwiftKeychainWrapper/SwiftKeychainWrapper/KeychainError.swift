//
//  KeychainError.swift
//  SwiftKeychainWrapper
//
//  Created by Gurunath Sripad on 4/9/22.
//

import Foundation

enum KeychainError: Error {
    case duplicateEntry
    case unknownError(OSStatus)
}
