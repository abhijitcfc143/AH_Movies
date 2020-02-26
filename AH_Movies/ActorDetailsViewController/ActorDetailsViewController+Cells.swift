//
//  ActorDetailsViewController+Cells.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation

extension ActorDetailsViewController{
    
    func showMovieInfoTableViewCell(indexPath : IndexPath) -> MovieInfoTableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.movieInfoTableViewCell, for: indexPath) as! MovieInfoTableViewCell
        
        if let actor = self.actor{
            if let moviePoster = actor.profile_path{
                cell.moviePosterImageView.downloaded(from: "\(APIRoutes.poster_pathAPI)\(moviePoster)")
            }
            
            if let movieName = actor.name{
                cell.movieName.text = movieName
            }else{
                cell.movieName.text = ""
            }
                        
            cell.movieRating.text = ""
                        
            if let actorDOB = actor.birthday{
                cell.movieReleaseDate.text = DateFormatUtils.dateFormatToDate(dateString: actorDOB)
            }else{
                cell.movieReleaseDate.text = ""
            }
            
            if let birthPlace = actor.place_of_birth{
                cell.movieGeners.text = birthPlace
            }else{
                cell.movieGeners.text = ""
            }
            
            if let info = actor.biography{
                cell.movieInfo.text = info
            }else{
                cell.movieInfo.text = ""
            }
            
            cell.starImageView.isHidden = true
            cell.starWidthConstraint.constant = 0
            cell.starHeightConstraint.constant = 0
        }
        
        if let movie = self.movie{
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
}
