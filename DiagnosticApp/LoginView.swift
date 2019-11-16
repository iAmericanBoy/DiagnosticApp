//
//  LoginView.swift
//  DiagnosticApp
//
//  Created by Dominic Lanzillotta on 11/16/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var enviroment: Int = 0
//    var login: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email:")
                .font(.title)
            EmailTextField(email: $email)
            Text("Password:")
                .font(.title)
            SecureTextField(password: $password, login: login)
            LoginButton(login: login)
            EnviromentPicker(enviroment: $enviroment)
            Spacer()
        }
        .padding(.leading, 15.0)
        .padding(.trailing, 15.0)
    }
    
    func login() {
        print("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct EmailTextField: View {
    @Binding var email: String

    var body: some View {
        TextField("Enter email", text: $email)
            .foregroundColor(Color.white)
            .padding()
            .background(Color(UIColor.lightGray))
            .cornerRadius(5.0)
    }
}

struct SecureTextField: View {
    @Binding var password: String
    var login: () -> Void
    
    var body: some View {
        SecureField("Enter Password", text: $password, onCommit: login)
            .padding()
            .background(Color(UIColor.lightGray))
            .cornerRadius(5.0)
    }
}

struct EnviromentPicker: View {
    @Binding var enviroment: Int
    var body: some View {
        Picker("", selection: $enviroment) {
            Text("CERT").tag(1)
            Text("PROD").tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct LoginButton: View {
    var login: () -> Void
    
    var body: some View {
        Button(action: login) {
            Spacer()
            Text("Login")
                .font(.title)
            Spacer()
        }
        .padding()
        .background(Color(UIColor.green))
        .cornerRadius(5.0)
    }
}
