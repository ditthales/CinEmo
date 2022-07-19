//
//  FeaturedViewController.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 07/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    @IBOutlet var seeAllPopular: UIButton!
    @IBOutlet var seeAllNowPlaying: UIButton!
    @IBOutlet var seeAllUpcoming: UIButton!
    
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        Task{
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
            self.upcomingMovies = await Movie.upcomingAPI()
            self.upcomingCollectionView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seeAllSegue"{
            if let destination = segue.destination as? SeeAllViewController{
                let movie = sender as? [Movie]
                destination.movie = movie
            }
        } else {
            if let destination = segue.destination as? DetailsViewController{
                let movie = sender as? Movie
                destination.movie = movie
            }
        }
    }
    
   
    @IBAction func seeAllButton(_ sender: UIButton) {
        if sender == seeAllPopular{
            performSegue(withIdentifier: "seeAllSegue", sender: popularMovies)
        } else if sender == seeAllNowPlaying{
            performSegue(withIdentifier: "seeAllSegue", sender: nowPlayingMovies)
        } else {
            performSegue(withIdentifier: "seeAllSegue", sender: upcomingMovies)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
