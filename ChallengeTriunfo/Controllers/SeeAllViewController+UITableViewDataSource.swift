//
//  SeeAllViewController+UITableViewDataSource.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movie = movie{
            return movie.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "seeAllCell") as? SeeAllTableViewCell{
            guard let movie = movie else {
                return SeeAllTableViewCell()
            }
            
            Task{
                let poster = await Movie.downloadImageData(withPath: movie[indexPath.item].posterPath ?? "")
                cell.setup(title: movie[indexPath.item].title , poster: (UIImage(data: poster) ?? UIImage(named: "posterPlaceholder")) ?? UIImage(), date: movie[indexPath.item].releaseDate, rating: String(movie[indexPath.item].voteAverage))
            }
            
            return cell
            
        }
        return SeeAllTableViewCell()
    }
    
    
}
