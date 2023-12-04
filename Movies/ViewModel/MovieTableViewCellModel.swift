//
//  MovieTableViewCellModel.swift
//  Movies
//
//  Created by Emre Öztürk on 4.12.2023.
//

import Foundation

class MovieTableViewCellModel {
    var id: Int
    var title: String
    var rating: String
    var imageURL: URL?
    
    init(movie: MovieModel) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? "Empty Title"
        self.rating = "\(movie.voteAverage)"
        self.imageURL = makeImageUrl(movie.posterPath)
    }
    
    private func makeImageUrl( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
