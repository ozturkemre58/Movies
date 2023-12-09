//
//  MainViewModel.swift
//  Movies
//
//  Created by Emre Öztürk on 3.12.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    var cellDataSource: Observable<[MovieTableViewCellModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        
        if self.isLoading.value ?? true {
            return
        }
        
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let response):
                self?.dataSource = response
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({ MovieTableViewCellModel(movie: $0) })
    }
    
    func retrieveMovie(with id: Int) -> MovieModel {
        if let movie = dataSource?.results.first(where: { $0.id == id }) {
            return movie
        }

        return MovieModel(
            adult: false,
            backdropPath: "",
            id: 0,
            name: nil,
            originalLanguage: .en,
            originalName: nil,
            overview: "",
            posterPath: "",
            mediaType: .movie,
            genreIDS: [],
            popularity: 0.0,
            firstAirDate: nil,
            voteAverage: 0.0,
            voteCount: 0,
            originCountry: nil,
            title: nil,
            originalTitle: nil,
            releaseDate: nil,
            video: false
        )
    }

}
