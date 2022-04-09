//
//  ViewController.swift
//  SwiftKeychainWrapper
//
//  Created by Gurunath Sripad on 4/9/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        savePassword()
        retrievePassword()
    }

    func savePassword() {
        do {
            try KeychainManager.save(service: "google.com", account: "test", password: "password google".data(using:.utf8) ?? Data())
        } catch {
            print(error)
        }
    }
    
    func retrievePassword() {
        do {
            guard let data = try KeychainManager.get(service: "google.com", account: "test") else {
                print("failed to retrive")
                return
            }
            let retrievedPassword = String.init(data:data, encoding: .utf8)
            print(retrievedPassword)
        } catch {
            print(error)
        }
    }

}

