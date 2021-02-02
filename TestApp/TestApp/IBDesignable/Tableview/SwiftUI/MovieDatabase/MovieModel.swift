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

enum MovieViewModelState {
    case listMovie([Movie])
    case error(Error)
    case emptyListMovie
}

class MovieViewModel: ObservableObject, DataClientProtocol {
    
    typealias DataModelResponse = MovieResponse
    @Published var state = MovieViewModelState.emptyListMovie
    var cancellationToken: AnyCancellable? // 2
    var remote: AnyPublisher<MovieResponse, Error>!
    var local: AnyPublisher<MovieResponse, Error>!
    init(with source: DataModelSource,
         remote: AnyPublisher<MovieResponse, Error>,
         local: AnyPublisher<MovieResponse, Error>) {
        self.remote = remote
//            ErrorDecodeClient<MovieResponse>().request(to: source)
//            .tryCatch {_ in Just(MovieResponse(movies: []))}
//            .eraseToAnyPublisher()
        self.local = local
//            LocalClient<MovieResponse>().request(to: source)
//            .tryCatch {_ in Just(MovieResponse(movies: []))}
//            .eraseToAnyPublisher()
        cancellationToken = self.request(to: MovieSource())
            .sink(receiveCompletion: { (error) in
                switch error {
                    case .finished:break
                    case .failure(let error):
                        self.state = .error(error)
                }
            }, receiveValue: { response in
                guard !response.movies.isEmpty else {
                    self.state = .emptyListMovie
                    return
                }
                self.state = .listMovie(response.movies)
            })
    }
    
    func request(to source: DataModelSource) -> AnyPublisher<MovieResponse, Error> {
        return Publishers.Concatenate(prefix: local, suffix: remote)
            .eraseToAnyPublisher()
    }
}

