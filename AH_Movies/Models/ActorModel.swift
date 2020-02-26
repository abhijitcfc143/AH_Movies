//
//  ActorModel.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation


struct ActorModel : Decodable{
    var birthday : String?
    var known_for_department : String?
    var id : Int?
    var name: String?
    var gender : Int?
    var biography : String?
    var popularity: Double?
    var place_of_birth: String?
    var profile_path: String?
    var adult: Bool?
    var imdb_id : String?
    var homepage : String?
}
