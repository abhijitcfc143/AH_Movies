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
        if let moviename = self.finalArray[safe : indexPath.row]?.title{
            cell.movieName.text = moviename
        }else{
            cell.movieName.text = ""
        }
        
        if let releaseDate = self.finalArray[safe : indexPath.row]?.release_date{
            cell.movieReleaseDate.text = DateFormatUtils.dateFormatToDate(dateString: releaseDate)
        }else{
            cell.movieReleaseDate.text = ""
        }
        
        if let movieImage = self.finalArray[safe : indexPath.row]?.poster_path{
            DispatchQueue.main.async {
                cell.movieImage.downloaded(from: "\(APIRoutes.poster_pathAPI)\(movieImage)")
            }
        }

//        cell.cellAnimationFromTopToBottom(view: cell.contentView)
        cell.layer.cornerRadius = 8.0
        
        if indexPath.row == self.finalArray.count - 1{
            self.getHomeMovies(page: pageNumber)
        }
        
        return cell
    }
}
