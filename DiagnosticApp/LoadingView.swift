//
//  LoadingView.swift
//  DiagnosticApp
//
//  Created by Dominic Lanzillotta on 11/17/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        ZStack(alignment: .center) {
            content()
                .disabled(isShowing)
                .blur(radius: isShowing ? 3 : 0)
                .animation(.default)
            ActivityIndicator(isAnimating: $isShowing, style: .large)
                .opacity(isShowing ? 1: 0)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(true)) {
            Text("Hello World")
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> ActivityIndicator.UIViewType {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
