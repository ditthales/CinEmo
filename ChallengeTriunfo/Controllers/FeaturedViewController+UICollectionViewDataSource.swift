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
    
    fileprivate func makePopularCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell{
            cell.setup(title: popularMovies[indexPath.row].title ?? "",
                       image: UIImage())
            let movie = popularMovies[indexPath.item]
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
                let imagem = UIImage(data: imageData)  ?? UIImage()
                cell.setup(title: movie.title ?? "", image: imagem)
            }
            return cell
        }
        
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell{
            cell.setup(title: nowPlayingMovies[indexPath.row].title ?? "",
                       image: UIImage(),
                       date: String(nowPlayingMovies[indexPath.row].releaseDate?.prefix(4) ?? ""))
            let movie = nowPlayingMovies[indexPath.item]
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let imagem = UIImage(data: imageData)  ?? UIImage()
                cell.setup(title: movie.title ?? "", image: imagem, date: String(nowPlayingMovies[indexPath.row].releaseDate?.prefix(4) ?? ""))
            }
            return cell
        }
        
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell{
            cell.setup(title: upcomingMovies[indexPath.row].title ?? "", image: UIImage(named: upcomingMovies[indexPath.row].posterPath ?? "posterPlaceholder") ?? UIImage(), date: String(upcomingMovies[indexPath.row].releaseDate?.prefix(4) ?? ""))
            let movie = upcomingMovies[indexPath.item]
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "posterPlaceholder")
                let imagem = UIImage(data: imageData)  ?? UIImage()
                cell.setup(title: movie.title ?? "", image: imagem, date: String(upcomingMovies[indexPath.row].releaseDate?.prefix(4) ?? ""))
            }
            return cell
        }
        
        return UpcomingCollectionViewCell()
    }
}
