//
//  SearchViewController+UITableViewDataSource.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

extension SearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.cellIdentifier) as? SearchTableViewCell{
            let movie = tableViewContents[indexPath.item]
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                cell.posterImageView.image = UIImage(data: imageData)
                cell.titleLabel.text = movie.title
                cell.dateLabel.text = movie.releaseDate
            }
            return cell
        }
        return SearchTableViewCell()
    }
    
    
}
