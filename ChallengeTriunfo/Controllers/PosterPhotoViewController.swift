//
//  PosterPhotoViewController.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

class PosterPhotoViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            Task{
                let imageDataPoster = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let poster = UIImage(data: imageDataPoster)  ?? UIImage(named: "posterPlaceholder")
                imageView.image = poster
            }
        }
        

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
