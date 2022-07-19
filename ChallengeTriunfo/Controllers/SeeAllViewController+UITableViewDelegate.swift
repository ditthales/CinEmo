//
//  SeeAllViewController+UITableViewDelegate.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movies: Movie
        movies = movie?[indexPath.row] ?? Movie(title: "", posterPath: "", backdropPath: "", voteAverage: 0, releaseDate: "", overview: "", genres: [])
        self.performSegue(withIdentifier: "seeAllDetailsSegue", sender: movies)
    }
}
