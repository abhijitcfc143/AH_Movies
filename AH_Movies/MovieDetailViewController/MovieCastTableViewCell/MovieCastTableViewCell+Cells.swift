//
//  MovieCastTableViewCell+Cells.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension MovieCastTableViewCell{
    
    func showMovieCastCharacterCollectionViewCell(indexPath : IndexPath) -> MovieCastCharacterCollectionViewCell{
        let cell = self.castCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIds.movieCastCharacterCollectionViewCell, for: indexPath) as! MovieCastCharacterCollectionViewCell
        
        
        cell.movieName.text = self.castArray?[indexPath.row].name ?? self.moviesArray?[indexPath.row].title
        cell.characterName.text = self.castArray?[indexPath.row].character ?? DateFormatUtils.dateFormatToDate(dateString: self.moviesArray?[indexPath.row].release_date ?? "")
        if let charImage = self.castArray?[indexPath.row].profile_path{
            DispatchQueue.main.async {
                cell.castImageView.downloaded(from: "\(APIRoutes.poster_pathAPI)\(charImage)")
            }
        }
        
        if let posterName = self.moviesArray?[indexPath.row].poster_path{
            DispatchQueue.main.async {
                cell.castImageView.downloaded(from: "\(APIRoutes.poster_pathAPI)\(posterName)")
            }
        }
        return cell
    }
}
