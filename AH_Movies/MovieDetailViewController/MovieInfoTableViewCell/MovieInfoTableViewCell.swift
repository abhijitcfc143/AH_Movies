//
//  MovieInfoTableViewCell.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import UIKit

class MovieInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieGeners: UILabel!
    @IBOutlet weak var movieInfo: UILabel!
    @IBOutlet weak var starHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var starWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var starImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code                       
        self.moviePosterImageView.layer.cornerRadius = 5.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
