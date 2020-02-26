//
//  HomeModels.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation

struct HomeSection {
    var sectionIndex : Int?
    var sectionTitle : String?
    var arrays : [Any]?
}

struct HomeMoviesList : Decodable{
    var title : String?
    var release_date : String?
    var poster_path : String?
    var id : Int?
}

struct HomeReponseObject : Decodable {
    var results : [HomeMoviesList]?
}

