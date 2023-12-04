//
//  APICaller.swift
//  Movies
//
//  Created by Emre Öztürk on 3.12.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    static func getTrendingMovies(completion: @escaping (_ result: Result<TrendingMovieModel,NetworkError>) -> Void) {
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
    
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completion(.success(resultData))

            } else {
                completion(.failure(.canNotParseData))
                
            }
            
        }.resume()
    }
}
