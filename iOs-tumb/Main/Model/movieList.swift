//
//  movieList.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 15/09/2021.
//

import Foundation

struct popularMovies: Decodable {
    var page: Int?
    var results: [Movie]
    var total_results: Int?
    var total_pages: Int?
    
    }

struct Movie: Decodable {
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_title: String
    var original_language: String?
    var title: String
    var backdrop_path: String?
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var vote_average: Double?
    
}

struct MovieReduced {
    var id: Int
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    var original_title: String
    var original_language: String?
    var title: String
    var vote_average: Double?
}


