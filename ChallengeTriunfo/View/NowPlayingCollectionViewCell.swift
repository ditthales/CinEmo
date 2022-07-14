//
//  NowPlayingCollectionViewCell.swift
//  ChallengeTriunfo
//
//  Created by ditthales on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, date: String){
        imageView.image = image
        titleLabel.text = title
        dateLabel.text = date
    }
    
}
