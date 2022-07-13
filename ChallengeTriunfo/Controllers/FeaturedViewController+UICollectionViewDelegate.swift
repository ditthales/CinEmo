//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let movie: Movie
        
        if collectionView == popularCollectionView{
            movie = popularMovies[indexPath.row]
        }else if collectionView == nowPlayingCollectionView{
            movie = nowPlayingMovies[indexPath.row]
        }else if collectionView == upcomingCollectionView{
            movie = upcomingMovies[indexPath.row]
        }else{
            movie = Movie(title: "", poster: "", backdrop: "", voteAverage: 0, releaseDate: "", overview: "", genres: [])
            print("Erro")
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        
    }
    
    
}
