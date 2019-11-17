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
    
    func login() {}
}
