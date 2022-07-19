//
//  SeeAllTableViewCell.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    static let cellIdentifier = "seeAllCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(title: String, poster: UIImage, date: String, rating: String){
        posterImageView.image = poster
        titleLabel.text = title
        dateLabel.text = date
        ratingLabel.text = rating
    }

}
