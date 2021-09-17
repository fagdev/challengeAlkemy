//
//  Networking.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 16/09/2021.
//

import Foundation
import Alamofire

final class MoviesProvider {
    
    static let shared = MoviesProvider()
    
    private let baseUrl = "https://api.themoviedb.org/3/movie/"
    private let statusOk = 200...299
    
    private let apiKey = "ef1c5439ded90a138fdb01a0a042cd3e"

    
//    func getMovies(success: @escaping (_ movie: [Results]) -> (), failure: @escaping (_ error: Error?) -> ()){
//
//        let url = "\(baseUrl)popular?api_key=ef1c5439ded90a138fdb01a0a042cd3e"
//        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable(of: popularMovies.self){
//        response in
//
//            if let movies = response.value?.results {
//                success(movies)
//
//            } else {
//                failure(response.error)
//            }
//
//        }
//
//
//    }
    
    func getMovies(completion: @escaping (Result<popularMovies,Error>) -> Void){
        
        let url = "\(baseUrl)popular?api_key=\(apiKey)"
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable(of: popularMovies.self){
        response in
            
            if let movie = response.value {
                completion(.success(movie))

            }

         }
    }
    

}
