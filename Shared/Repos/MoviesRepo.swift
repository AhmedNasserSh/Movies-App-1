//
//  MoviesRepo.swift
//  MoviesApp (iOS)
//
//  Created by Ahmed Ragab on 08/05/2022.
//

import Foundation

protocol MoviesRepoProtocol{
      func fetchMovies(from:MovieListEndPoints) async throws -> [Movie]
//    mutating func fetchAllMovies() async throws -> [MovieSection]
}


class MoviesRepo:MoviesRepoProtocol{
    // MARK: - properties
    private lazy var movieBaseAppStore:MoviesAppBaseStoreProtocol = MoviesAppBaseStore()
    private let baseEndPointUrl = "\(Utils.BaseApiUrl)/movie/"
    
    // MARK: Functions
     func fetchMovies(from endpoint: MovieListEndPoints) async  throws -> [Movie] {
        guard let url = URL(string: "\(baseEndPointUrl)\(endpoint.rawValue)") else {  throw MoviesAppError.invalidEndPoints}
        do{
            let movies:MovieResponse =  try await movieBaseAppStore.loadURLAndDecode(url: url, params: nil)
            return movies.results ?? []
        } catch{
            throw error
        }
        
    }

}


