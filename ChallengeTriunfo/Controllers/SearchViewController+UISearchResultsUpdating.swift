//
//  SearchViewController+UISearchResultsUpdating.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        Task{
            if let texto = searchController.searchBar.text{
                tableViewContents = await Movie.searchAPI(searchString: texto)
                tableViewDeSearch.reloadData()
            }
        }
        
        //print(tableViewContents)
        
    }
    
    
}
