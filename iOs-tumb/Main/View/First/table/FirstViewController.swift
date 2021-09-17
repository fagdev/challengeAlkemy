//
//  FirstViewController.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 15/09/2021.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
 
    private var viewModel = MoviesViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(moviesTableViewCell.self,  forCellReuseIdentifier: "customCell")
        tableView.dataSource = self
        tableView.reloadData()
        tableView.delegate = self

        // Do any additional setup after loading the view.
        getData()

    }

    
    private func getData(){
        viewModel.getPopularMovies{[weak self] in
            
//            self?.tableView.dataSource = self
              self?.tableView.reloadData()


        }
    }
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! moviesTableViewCell
        
        let movie = viewModel.cellForRow(indexPath: indexPath)
        
//        cell.setCellData(movie: movie)
        
        cell.textLabel?.text = movie.original_title
        
        return cell
    }
    
}

extension FirstViewController: UITabBarDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(viewModel.cellForRow(indexPath: indexPath))
        let vc = movieDetailViewController(nibName: "movieDetailViewController", bundle: nil)
        
        let originDataMovie = viewModel.cellForRow(indexPath: indexPath)
        
        vc.currentMovie = MovieReduced(id: originDataMovie.id!, poster_path: originDataMovie.poster_path, adult: originDataMovie.adult, overview: originDataMovie.overview
                     , release_date: originDataMovie.release_date, original_title: originDataMovie.original_title, original_language: originDataMovie.original_language, title: originDataMovie.title, vote_average: originDataMovie.vote_average)


        self.present(vc, animated: true)
    }
}
