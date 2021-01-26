//
//  MoviesView.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 1/23/21.
//  Copyright © 2021 thond. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    
    // 1
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
       VStack {
            List(viewModel.movies) { movie in // 2
                HStack {
                    VStack(alignment: .leading) {
                        Text(movie.title + "thond") // 3a
                            .font(.headline)
                        Text(movie.originalTitle) // 3b
                            .font(.subheadline)
                    }
                }
            }
        Text("\(viewModel.error?.localizedDescription ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            MoviesView()
        }
    }
}
