//
//  MovieViewBuilder.swift
//  DiagnosticApp
//
//  Created by Dominic Lanzillotta on 11/26/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import SwiftUI

public enum MovieViewBuilder {
    public static func makeMovieView() -> some View {
        return MovieView(viewModel: MovieViewModel())
    }
}
