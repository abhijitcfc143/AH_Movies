//
//  ReviewModel.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation

struct ReviewModel : Decodable{
    var author : String?
    var content : String?
    var id : String?
    var url : String?
}

struct ReviewResponseObject : Decodable{
    var id : Int?
    var page : Int?
    var results : [ReviewModel]?
    var total_pages : Int?
    var total_results : Int?
}
