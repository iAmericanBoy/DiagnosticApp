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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                completion(true)
            }
        case .Production:
            completion(false)
        }
    }
}
