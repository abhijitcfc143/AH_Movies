//
//  MovieCastTableViewCell.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import UIKit

class MovieCastTableViewCell: UITableViewCell {

    @IBOutlet weak var castCollectionView: UICollectionView!
    var castArray : [CastModel]?
    var moviesArray : [HomeMoviesList]?
    
    let sectionInsets = UIEdgeInsets(top: 16.0, left: 8.0, bottom: 0.0, right: 4.0)
    let itemsPerRow: CGFloat = 3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
