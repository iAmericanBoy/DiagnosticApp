//
//  LoginViewModel.swift
//  DiagnosticApp
//
//  Created by Dominic Lanzillotta on 11/16/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject  {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var enviroment: Int = 0
    
    @Published var isLoading: Bool = false
    @Published var isLoginDisabled: Bool = false
    @Published var isLoginWrong: Bool = false
    @Published var isLoggedIn: Bool = false
    
    private var loginService: LoginProtocol

    init(loginService: LoginProtocol = MockLogin()) {
        self.loginService = loginService
    }
    
    func login() {
        isLoading = true
        loginService.login(username: email, password: password, enviroment: SessionEnviroment(rawValue: enviroment)!) { [weak self] result in
            self?.isLoading = false
            switch result {
            case true:
                self?.isLoggedIn = true
            case false:
                self?.isLoginWrong.toggle()
            }
        }
    }
}
