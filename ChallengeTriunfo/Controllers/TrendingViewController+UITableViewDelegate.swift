//
//  TrendingViewController+UITableViewDelegate.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie
        movie = trendingMoviesContent[indexPath.row]
        self.performSegue(withIdentifier: "trendingDetailsSegue", sender: movie)
    }
}
