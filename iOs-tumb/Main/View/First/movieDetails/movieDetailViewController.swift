//
//  movieDetailViewController.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 16/09/2021.
//

import UIKit

class movieDetailViewController: UIViewController {
 
    private var urlString: String = ""
    
    var currentMovie = MovieReduced(id: 0, poster_path: "", adult: false, original_title: "original_title", title: "title")
    
    @IBOutlet weak var posterMovie: UIImageView!
    
    @IBOutlet weak var titleMovie: UILabel!
           
    @IBOutlet weak var overview: UITextView!
    
    @IBOutlet weak var rateMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleMovie.text = currentMovie.title
        
        overview.text = currentMovie.overview
        
        updateUI(poster: currentMovie.poster_path)
        
        guard let rateNumber = currentMovie.vote_average else {return}
        rateMovie.text = String(rateNumber)

    }
    
    @IBAction func likeAction(_ sender: Any) {
        

    }
    

    private func updateUI(poster: String?) {
 
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.posterMovie.image = UIImage(named: "noImageAvailable")
            return
        }
        
        // Before we download the image we clear out the old one
        self.posterMovie.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
               return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.posterMovie.image = image
                }
            }
        }.resume()
    }
    



}
