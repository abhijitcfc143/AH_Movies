//
//  MovieDetailViewControllerAPIs.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation

//MARK:- API Calls
extension MovieDetailViewController{
    
    func getMovie(url: URL,completionHandler: @escaping (Movie)->()){

        url.asyncDownload { data, response, error in
            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            do{
                let responseObject = try JSONDecoder().decode(Movie.self, from: data)
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler(responseObject)
                    })
            } catch {
                print("JSONSerialization error:", error)
            }
        }
    }
    
    func getReview(url : URL, completionHandler : @escaping ([ReviewModel]) ->()){
        url.asyncDownload { data, response, error in
            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            do{
                let responseObject = try JSONDecoder().decode(ReviewResponseObject.self, from: data)
                if let reviews = responseObject.results{
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler(reviews)
                    })
                }
            } catch {
                print("JSONSerialization error:", error)
            }
        }
    }
    
    func getCredits(url : URL, completionHandler : @escaping (CreditsReponseObject) ->()){
        url.asyncDownload { data, response, error in
            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            do{
                let responseObject = try JSONDecoder().decode(CreditsReponseObject.self, from: data)
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler(responseObject)
                    })
            } catch {
                print("JSONSerialization error:", error)
            }
        }
    }
    
    func getRecommendedFeed(url: URL,completionHandler: @escaping ([HomeMoviesList])->()){
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
