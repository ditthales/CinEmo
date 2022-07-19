//
//  SeeAllViewController.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {

    var movie: [Movie]?
    var viewTitle: String?
    
    @IBOutlet var seeAllTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seeAllTableView.dataSource = self
        
        // Do any additional setup after loading the view.
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
