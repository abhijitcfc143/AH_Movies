//
//  MovieDetailViewController+Cells.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

//MARK:- TableViewCells
extension MovieDetailViewController{
    
    func showMovieImageTableViewCell(indexPath : IndexPath) -> MovieImageTableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.movieImageTableViewCell, for: indexPath) as! MovieImageTableViewCell
        if let movie = self.fArray[indexPath.section].arrays?[indexPath.row] as? Movie,let movieImage = movie.backdrop_path{
            cell.movieImageView.downloaded(from: "\(APIRoutes.poster_pathAPI)\(movieImage)")
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.yellow,UIColor.yellow]
            gradientLayer.locations = [0,0.5]
            gradientLayer.frame = cell.movieImageView.frame
            cell.movieImageView.layer.insertSublayer(gradientLayer, at: 0)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        return cell
    }
    
    func showMovieInfoTableViewCell(indexPath : IndexPath) -> MovieInfoTableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.movieInfoTableViewCell, for: indexPath) as! MovieInfoTableViewCell
        
        if let movie = self.fArray[indexPath.section].arrays?[indexPath.row] as? Movie{
            if let moviePoster = movie.poster_path{
                cell.moviePosterImageView.downloaded(from: "\(APIRoutes.poster_pathAPI)\(moviePoster)")
            }
            
            if let movieName = movie.title{
                cell.movieName.text = movieName
            }else{
                cell.movieName.text = ""
            }
            
            if let voteAverage = movie.vote_average{
                cell.movieRating.text = "\(voteAverage)"
            }else{
                cell.movieRating.text = ""
            }
            
            if let releaseDate = movie.release_date{
                cell.movieReleaseDate.text = DateFormatUtils.dateFormatToDate(dateString: releaseDate)
                    
            }else{
                cell.movieReleaseDate.text = ""
            }
            
            if let genres = movie.genres{
                
                let generAr = genres.map { (gener) -> String in
                    return gener.name ?? ""
                }
                
                cell.movieGeners.text = generAr.joined(separator: " ,")
            }else{
                cell.movieGeners.text = ""
            }
            
            if let info = movie.overview{
                cell.movieInfo.text = info
            }else{
                cell.movieInfo.text = ""
            }
            
            
        }
        return cell
    }
    
    func showMovieReviewTableViewCell(indexPath : IndexPath) -> MovieReviewTableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.movieReviewTableViewCell, for: indexPath) as! MovieReviewTableViewCell
        if let author = self.fArray[indexPath.section].arrays?[indexPath.row] as? ReviewModel{

            if let authorName = author.author{
                cell.authorName.text = authorName
                if let authorInitials = authorName.first{
                    cell.authorFirstLetter.text = "\(authorInitials)".capitalizingFirstLetter()
                }
            }
            
            if let review = author.content{
                cell.review.text = review
            }
            
        }
        return cell
        
    }
    
    func showMovieCastTableViewCell(indexPath : IndexPath) -> MovieCastTableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.movieCastTableViewCell, for: indexPath) as! MovieCastTableViewCell
        cell.castArray = self.fArray[indexPath.section].arrays as? [CastModel]
        cell.moviesArray = self.fArray[indexPath.section].arrays as? [HomeMoviesList]
        cell.setupDelegatesAndDatasource()
        cell.castCollectionView.reloadData()
        return cell
    }
}
