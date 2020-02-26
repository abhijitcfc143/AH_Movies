//
//  MovieModel.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation

struct Movie : Decodable{
    var adult : Bool?
    var backdrop_path : String?
//      var belongs_to_collection : null
    var budget : Int?
    var genres : [Gener]?
    var homepage : String?
    var id : Int?
    var imdb_id : String?
    var original_language : String?
    var original_title : String?
    var overview : String?
    var popularity : Double?
    var poster_path : String?
    var production_companies : [ProductionCompanies]?
    var production_countries : [ProductionCountries]?
    var release_date : String?
    var revenue : Int?
    var runtime : Int?
    var spoken_languages : [SpokenLanguages]?
    var status : String?
    var tagline : String?
    var title: String?
    var video : Bool?
    var vote_average : Double?
    var vote_count: Int?
}


struct Gener : Decodable{
    let id : Int?
    let name : String?
}

struct ProductionCompanies : Decodable{
    var name : String?
    var id : Int?
    var logo_path : String?
    var origin_country : String?
}

struct ProductionCountries : Decodable{
    var iso_3166_1 : String?
    var name : String?
}

struct SpokenLanguages : Decodable{
    var iso_639_1 : String?
    var name : String?
}
