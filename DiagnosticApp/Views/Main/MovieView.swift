//
//  MainView.swift
//  DiagnosticApp
//  MovieView
//
//  Created by Dominic Lanzillotta on 11/17/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject var viewModel: MovieViewModel = MovieViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TextField("Enter name of Movie", text: $viewModel.movieName, onCommit: viewModel.onCommit)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color(UIColor.lightGray))
                    .cornerRadius(5.0)
                Button(action: viewModel.onCommit) {
                    Text("Search")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(UIColor.lushGreenColor))
                .cornerRadius(5.0)
            }
        }
        .padding(.leading, 15.0)
        .padding(.trailing, 15.0)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
