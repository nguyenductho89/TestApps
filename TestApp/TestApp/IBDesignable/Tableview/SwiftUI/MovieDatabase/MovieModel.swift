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

class ViewModel<T>: DataClientProtocol {
    typealias DataModelResponse = T
    private var remotePublisher: AnyPublisher<T, Error>!
    private var localPublisher: AnyPublisher<T, Error>!
    var dataPublisher: AnyPublisher<T, Error>!
    
    init(with source: DataModelSource,
         remote: AnyPublisher<T, Error>,
         local: AnyPublisher<T, Error>) {
        self.remotePublisher = remote
        self.localPublisher = local
        self.dataPublisher = self.request(to: source)
    }
    
    func request(to source: DataModelSource) -> AnyPublisher<T, Error> {
        return Publishers.Concatenate(prefix: localPublisher, suffix: remotePublisher)
            .eraseToAnyPublisher()
    }
}

class MovieViewModel: ViewModel<MovieResponse>, ObservableObject {
    @Published var state = MovieViewModelState.emptyListMovie
    var cancellationToken: AnyCancellable? // 2
    
    override init(with source: DataModelSource,
                  remote: AnyPublisher<MovieResponse, Error>,
                  local: AnyPublisher<MovieResponse, Error>) {
        super.init(with: source, remote: remote, local: local)
        cancellationToken = self.dataPublisher.sink(receiveCompletion: { (error) in
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
}
