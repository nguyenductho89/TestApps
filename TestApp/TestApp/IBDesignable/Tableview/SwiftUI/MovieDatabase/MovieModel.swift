//
//  MovieModel.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 1/23/21.
//  Copyright © 2021 thond. All rights reserved.
//

import Foundation
import Combine

struct MovieResponse: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

class MovieViewModel: ObservableObject, DataClientProtocol {
    
    typealias DataModelResponse = MovieResponse
    
    @Published var movies: [Movie] = [] // 1
    @Published var error: Error? // 1
    var cancellationToken: AnyCancellable? // 2
    
    init() {
        cancellationToken = self.request(to: MovieSource())
            .mapError({ (error) -> Error in // 5
                self.error = error
                return error
            })
            .sink(receiveCompletion: { _ in }, // 6
                  receiveValue: {
                    self.movies = $0.movies
                    self.error = nil
                  })
    }
    
    func request(to source: DataModelSource) -> AnyPublisher<MovieResponse, Error> {
        let remote = RestfulClient<MovieResponse>().request(to: source)
        let local = ErrorDecodeClient<MovieResponse>().request(to: source)
        return Publishers.Concatenate(prefix: local, suffix: remote).eraseToAnyPublisher()
    }
}

