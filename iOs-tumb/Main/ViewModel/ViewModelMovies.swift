//
//  dataApi.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 16/09/2021.
//

import Foundation

class MoviesViewModel {
    
    private let apiProvider = MoviesProvider()
    private var popularMovies = [Movie]()
    
    func getPopularMovies(completion: @escaping () -> ()){
        
        apiProvider.getMovies { [weak self] (result) in
            switch result {
            case .success(let list):
                self?.popularMovies = list.results
                completion()
            case . failure(let error):
                print("Error data: \(error)")
            }
        }
    }
    
    
    func rowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }
    
    
    func cellForRow (indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
    

}
