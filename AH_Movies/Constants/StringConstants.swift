//
//  StringConstants.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 24/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

struct APIRoutes {
    static let homeAPI = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIKey.apiKey)"
    static let detailPageAPI = ""
    static var poster_pathAPI = "https://image.tmdb.org/t/p/w780"
    static var movieAPI = "https://api.themoviedb.org/3/movie/"
    static var personAPI = "https://api.themoviedb.org/3/person/"
}

struct ViewControllerIDs {
    static let homeViewController = "HomeViewController"
    static let movieDetailViewController = "MovieDetailViewController"
    static let actorDetailsViewController = "ActorDetailsViewController"
}

struct StoryboardIDs {
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
}

struct CollectionViewCellIds {
    static let movieCollectionViewCell = "MovieCollectionViewCell"
    static let searchBarCell = "SearchBarCell"
    static let movieCastCharacterCollectionViewCell = "MovieCastCharacterCollectionViewCell"
}

struct TableViewCellIds {
    static let movieImageTableViewCell = "MovieImageTableViewCell"
    static let movieInfoTableViewCell = "MovieInfoTableViewCell"
    static let movieReviewTableViewCell = "MovieReviewTableViewCell"
    static let tableViewHeaderCell = "TableViewHeaderCell"
    static let movieCastTableViewCell = "MovieCastTableViewCell"
}

struct APIKey {
    static let apiKey = "facd1db4174f794ee4c5a8b3792e564b"
}

struct NotificationNames {
    static let castClickedInCollectionView = "castClickedInCollectionView"
    static let movieClickedInCollectionView = "movieClickedInCollectionView"
}
