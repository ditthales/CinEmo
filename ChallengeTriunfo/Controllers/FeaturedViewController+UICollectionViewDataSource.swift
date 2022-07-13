//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource{
    
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
    
    fileprivate func makePopularCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell{
            cell.image.image = UIImage(named: popularMovies[indexPath.row].backdrop)
            cell.titleLabel.text = popularMovies[indexPath.row].title
            return cell
        }
        
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell{
            cell.image.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
            cell.titleLabel.text = nowPlayingMovies[indexPath.row].title
            cell.dateLabel.text = String(nowPlayingMovies[indexPath.row].releaseDate.prefix(4))
            return cell
        }
        
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell{
            cell.image.image = UIImage(named: upcomingMovies[indexPath.row].poster)
            cell.titleLabel.text = upcomingMovies[indexPath.row].title
            let arrayDeSubstring = upcomingMovies[indexPath.row].releaseDate.split(separator: "-")
            cell.dateLabel.text = "\(arrayDeSubstring[2])/\(arrayDeSubstring[1])"
            return cell
        }
        
        return UpcomingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView{
            return makePopularCell(collectionView, indexPath)
        }else if collectionView == nowPlayingCollectionView{
            return makeNowPlayingCell(collectionView, indexPath)
        }else if collectionView == upcomingCollectionView{
            return makeUpcomingCell(collectionView, indexPath)
        }else{
            return UICollectionViewCell()
        }
        
        
    }
}
