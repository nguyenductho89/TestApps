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

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = [] // 1
    var cancellationToken: AnyCancellable? // 2
    
    init() {
        getMovies() // 3
    }
    
}

extension MovieViewModel {
    
    // Subscriber implementation
    func getMovies() {
        cancellationToken = MovieDB.request(.trendingMoviesWeekly) // 4
            .mapError({ (error) -> Error in // 5
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, // 6
                  receiveValue: {
                    self.movies = $0.movies // 7
            })
    }
    
}

