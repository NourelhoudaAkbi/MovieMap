//
//  Bundle+Extension.swift
//  TheMovieDB
//
//  Created by Nour el houda Akbi on 27/9/2024.
//

import Foundation

// MARK: - BUNDLE EXTENSION

extension Bundle {
    
    func decode<T: Codable>(filename: String) -> T {
        // 1. Locate the JSON file
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to locate \(filename) in bundle.")
        }
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(filename) from bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // 4. Create a property for the decoded data
        guard let decodedModel = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(filename) from bundle.")
        }
        
        // 5. Return the ready-to-use data
        return decodedModel
    }
}

// MARK: - MOVIE EXTENSION

extension Media {
    
    // 1. Decode movie_list.json
    static var localMovies: [Media] {
        let response: MediaResponse = Bundle.main.decode(filename: "movie_list")
        return response.results
    }
    
    // 2. Create an example movie
    static var localMovie: Media {
        localMovies[0]
    }
    
    // 3. Decode tv_list.json
    static var localTVs: [Media] {
        let response: MediaResponse = Bundle.main.decode(filename: "tv_list")
        return response.results
    }
    
    // 4. Create an example tv
    static var localTV: Media {
        let tv: Media = Bundle.main.decode(filename: "tv_info")
        return tv
    }
    
//    // 3. Decode movie_credits.json for development
//    static var localCredits: [MovieCast] {
//        let response: MovieCredit = Bundle.main.decode(filename: "movie_credits")
//        return response.cast
//
//    }
//
//    // 4. Decode movie_similar.json for development
//    static var localSimilar: [Movie] {
//        let response: MovieSimilarResponse = Bundle.main.decode(filename: "movie_similar")
//        return response.results
//    }
}
