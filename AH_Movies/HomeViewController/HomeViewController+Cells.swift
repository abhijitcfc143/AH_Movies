//
//  HomeViewController+Cells.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController{
    
    func showMovieCollectionViewCell(indexPath : IndexPath) -> MovieCollectionViewCell {
        
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIds.movieCollectionViewCell, for: indexPath) as! MovieCollectionViewCell
        if let moviename = self.finalArray[indexPath.row].title{
            cell.movieName.text = moviename
        }else{
            cell.movieName.text = ""
        }
        
        if let releaseDate = self.finalArray[indexPath.row].release_date{
            cell.movieReleaseDate.text = DateFormatUtils.dateFormatToDate(dateString: releaseDate)
        }else{
            cell.movieReleaseDate.text = ""
        }
        
        if let movieImage = self.finalArray[indexPath.row].poster_path{
            DispatchQueue.main.async {
                cell.movieImage.downloaded(from: "\(APIRoutes.poster_pathAPI)\(movieImage)")
            }
        }

        cell.cellAnimationFromTopToBottom(view: cell.contentView)
        cell.layer.cornerRadius = 8.0
        
        return cell
    }
}
