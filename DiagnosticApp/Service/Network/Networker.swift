//
//  Networker.swift
//  DiagnosticApp
//
//  Created by Dominic Lanzillotta on 1/22/20.
//  Copyright © 2020 Dominic Lanzillotta. All rights reserved.
//

import Foundation
import Combine

struct Networker {
    
    struct Response<T>  {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest,_ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
