//
//  MovieCastCharacterCollectionViewCell.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import UIKit

class MovieCastCharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var characterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
