//
//  TrendingViewController.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    @IBOutlet var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet var trendingTableView: UITableView!
    var isToday: Bool = true
    var trendingMoviesContent: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trendingTableView.dataSource = self
        trendingTableView.delegate = self
        
        Task{
            trendingMoviesContent = await Movie.trendingAPI(isToday: isToday)
            trendingTableView.reloadData()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if segmentedControlOutlet.selectedSegmentIndex == 1{
            isToday = false
        }else{
            isToday = true
        }
        Task{
            trendingMoviesContent = await Movie.trendingAPI(isToday: isToday)
        }
        trendingTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    
}

