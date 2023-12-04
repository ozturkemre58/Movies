//
//  NetworkConstant.swift
//  Movies
//
//  Created by Emre Öztürk on 3.12.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //for singletone
    }
    
    public var apiKey: String {
        return "9e8b466a8b08b35c681d1b053f463bfc"
    }
        
    public var serverAddress: String {
        return "https://api.themoviedb.org/3/"
    }
    
    public var imageServerAddress: String {
        return "https://image.tmdb.org/t/p/original/"
    }
}
