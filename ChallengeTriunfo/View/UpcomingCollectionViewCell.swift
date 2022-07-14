//
//  UpcomingCollectionViewCell.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, date: String){
        imageView.image = image
        titleLabel.text = title
        dateLabel.text = date
    }
    
}
