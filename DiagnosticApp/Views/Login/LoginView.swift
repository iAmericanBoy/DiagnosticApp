//
//  LoginView.swift
//  DiagnosticApp
//
//  Created by Dominic Lanzillotta on 11/16/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        LoadingView(isShowing: $viewModel.isLoading) {
            VStack(alignment: .leading) {
                Text("Email:")
                    .font(.title)
                EmailTextField(email: self.$viewModel.email)
                Text("Password:")
                    .font(.title)
                SecureTextField(password: self.$viewModel.password, login: self.viewModel.login)
                LoginButton(isDisabled: self.$viewModel.isLoginDisabled, wasFail: self.$viewModel.isLoginWrong, login: self.viewModel.login)
                EnviromentPicker(enviroment: self.$viewModel.enviroment)
                Spacer()
            }
            .padding(.leading, 15.0)
            .padding(.trailing, 15.0)
        }
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
    @Binding var isDisabled: Bool
    @Binding var wasFail: Bool

    var login: () -> Void
    
    var body: some View {
        Button(action: login) {
            Spacer()
            Text("Login")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color.white)
        .background(Color(UIColor.lushGreenColor))
        .cornerRadius(5.0)
        .modifier(Shake(animatableData: CGFloat(wasFail ? 1 : 0 )))
        .disabled(isDisabled)
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 5
    var shakesPerUnit: CGFloat = 5
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * shakesPerUnit), y: 0))
    }
}
