//
//  CreditsModel.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation

struct CastModel : Decodable {
    var cast_id : Int?
    var character: String?
    var credit_id: String?
    var gender: Int?
    var id : Int?
    var name: String?
    var order: Int?
    var profile_path: String?
}

struct CrewModel : Decodable{
    var credit_id : String?
    var department : String?
    var gender : Int?
    var id : Int?
    var job : String?
    var name : String?
    var profile_path : String?
}

struct CreditsReponseObject : Decodable{
    var id : Int?
    var cast : [CastModel]?
    var crew : [CrewModel]?
}
