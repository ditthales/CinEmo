//
//  TrendingViewController+UITableViewDataSource.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMoviesContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier) as? TrendingTableViewCell{
            let movie = trendingMoviesContent[indexPath.item]
            Task{
                let poster = await UIImage(data: Movie.downloadImageData(withPath: movie.posterPath ?? ""))
                cell.setup(title: movie.title ?? "", poster: poster ?? UIImage(), date: movie.releaseDate ?? "")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
