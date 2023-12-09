//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Emre Öztürk on 9.12.2023.
//

import Foundation

class MovieDetailViewModel {
    var movie: MovieModel
    var movieTitle: String?
    var movieDescription: String?
    var movieImage: URL?
    var movieId: Int?
    
    init(movie: MovieModel) {
        self.movie = movie
        
        self.movieId = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImage(movie.backdropPath ?? "")
    }
    
    private func makeImage(_ imageCode:String) ->  URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
