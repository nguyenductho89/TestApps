//
//  NetworkLayer.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 1/23/21.
//  Copyright © 2021 thond. All rights reserved.
//

import Foundation
import Combine

public protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}

protocol DataModelSource: URLRequestConvertible {}

protocol DataClientProtocol {
    func request<T: Codable>(from source: DataModelSource) -> AnyPublisher<T, Error>
}

struct RestfulClient: DataClientProtocol {

    func request<T: Codable>(from source: DataModelSource) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: source.asURLRequest()) // 3
            .tryMap { result -> T in
                let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                return value
            }
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
}

struct RestApiClient {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> { // 2
        return URLSession.shared
            .dataTaskPublisher(for: request) // 3
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                return Response(value: value, response: result.response) // 5
            }
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
}
