//
//  SearchViewController+UITableViewDelegate.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

extension SearchViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie
        movie = tableViewContents[indexPath.row]
        self.performSegue(withIdentifier: "searchDetailsSegue", sender: movie)
    }
}
