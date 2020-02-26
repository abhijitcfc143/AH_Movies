//
//  MovieReviewTableViewCell.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import UIKit

class MovieReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var review: UILabel!
    @IBOutlet weak var authorFirstLetter: UILabel!
    @IBOutlet weak var authorFirstLetterUIView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.authorFirstLetterUIView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
