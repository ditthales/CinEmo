//
//  FeaturedViewController.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 07/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    let popularMovies: [Movie] = Movie.popularMovies()
    let nowPlayingMovies: [Movie] = Movie.nowPlayingMovies()
    let upcomingMovies: [Movie] = Movie.upcomingMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView{
            return popularMovies.count
        }else if collectionView == nowPlayingCollectionView{
            return nowPlayingMovies.count
        }else if collectionView == upcomingCollectionView{
            return upcomingMovies.count
        }else{
            return 1
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell{
                cell.image.image = UIImage(named: popularMovies[indexPath.row].backdrop)
                cell.titleLabel.text = popularMovies[indexPath.row].title
                return cell
            }
            
            return UICollectionViewCell()
        }else if collectionView == nowPlayingCollectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell{
                cell.image.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
                cell.titleLabel.text = nowPlayingMovies[indexPath.row].title
                cell.dateLabel.text = nowPlayingMovies[indexPath.row].releaseDate
                return cell
            }
            
            return UICollectionViewCell()
        }else if collectionView == upcomingCollectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCollectionViewCell{
                cell.image.image = UIImage(named: upcomingMovies[indexPath.row].poster)
                cell.titleLabel.text = upcomingMovies[indexPath.row].title
                cell.dateLabel.text = upcomingMovies[indexPath.row].releaseDate
                return cell
            }
            
            return UICollectionViewCell()
        }else{
            return UICollectionViewCell()
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
