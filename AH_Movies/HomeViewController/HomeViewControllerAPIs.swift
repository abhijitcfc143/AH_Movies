//
//  HomeViewControllerAPIs.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 24/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation

//MARK:- API Calls
extension HomeViewController{
            
    func getMoviesHomeFeed(url: URL,completionHandler: @escaping ([HomeMoviesList])->()){

        url.asyncDownload { data, response, error in
            
            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            do{
                let responseObject = try JSONDecoder().decode(HomeReponseObject.self, from: data)
               
                if let feedObject = responseObject.results{
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler(feedObject)
                    })
                }
            } catch {
                print("JSONSerialization error:", error)
            }
        }
    }
}
