//
//  MockLogin.swift
//  DiagnosticApp
//
//  Created by Dominic Lanzillotta on 11/17/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import Foundation

protocol LoginProtocol {
    func login(username: String, password: String, enviroment: SessionEnviroment, completion: @escaping (Bool) -> Void)
}

class MockLogin: LoginProtocol {
    func login(username: String, password: String, enviroment: SessionEnviroment, completion: @escaping (Bool) -> Void) {
        switch enviroment {
        case .Certification:
            _ = Timer(timeInterval: 3.0, repeats: false) { _ in print("Done!") }
            completion(true)
        case .Production:
            completion(false)
        }
    }
}
