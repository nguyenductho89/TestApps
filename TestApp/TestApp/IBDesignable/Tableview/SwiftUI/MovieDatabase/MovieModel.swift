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
    
    init() {
        cancellationToken = self.request(to: MovieSource()).sink(receiveCompletion: { (error) in
            guard let error = error as? Error else {return}
            self.state = .error(error)
        }, receiveValue: { response in
            guard !response.movies.isEmpty else {
                self.state = .emptyListMovie
                return
            }
            self.state = .listMovie(response.movies)
        })
    }
    
    func request(to source: DataModelSource) -> AnyPublisher<MovieResponse, Error> {
        let remote = RestfulClient<MovieResponse>().request(to: source)
        let local = LocalClient<MovieResponse>().request(to: source)
            .tryCatch {_ in Just(MovieResponse(movies: []))}
            .eraseToAnyPublisher()
        return Publishers.Concatenate(prefix: local, suffix: remote)
            .print("thond:", to: nil)
            .eraseToAnyPublisher()
    }
}

