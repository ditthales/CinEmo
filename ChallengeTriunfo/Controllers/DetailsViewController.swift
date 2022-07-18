//
//  DetailsViewController.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var backdropImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        titleLabel.text = movie.title

        Task{
            let imageDataBackdrop = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
            // FIXME: trocar os ?? quando implementar API
            let backdrop = UIImage(data: imageDataBackdrop)  ?? UIImage(named: movie.backdropPath ?? "")
            backdropImageView.image = backdrop
            
            let imageDataPoster = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let poster = UIImage(data: imageDataPoster)  ?? UIImage(named: movie.posterPath ?? "")
            posterImageView.image = poster
        }
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        

        
        // Do any additional setup after loading the view.
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
