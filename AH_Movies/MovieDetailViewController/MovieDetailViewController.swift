//
//  MovieDetailViewController.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var homeMovieObj : HomeMoviesList?
    var movie : Movie?
    var reviewsAr : [ReviewModel]?
    var fArray = [HomeSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
}

extension MovieDetailViewController{
    func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        if let movieName = homeMovieObj?.title{
            self.title = movieName
        }
        self.setupDelegateAndDatSource()
        
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        self.getMovieById(id: nil, homeId: homeMovieObj?.id) { (_) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        self.getCreditsByMovieId {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        self.getReviewsByMovieId {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        self.getRecommendationByMovieId {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.sortFinalArrayBySectionIndex()
        }
        
    }
    
    func sortFinalArrayBySectionIndex() {
        let unsortedAr = self.fArray
        var sortedArr = [HomeSection]()
        sortedArr = unsortedAr.sorted(by: { (hm1, hm2) -> Bool in
            return (hm1.sectionIndex!) < (hm2.sectionIndex!)
        })
        
        self.fArray = sortedArr
        self.tableView.reloadData()
        self.tableView.isHidden = false
    }
    
    
    func getMovieById(id:Int?,homeId : Int?, completionHandler : @escaping (Movie)->()) {
        if let homeId = homeId{
            self.tableView.isHidden = true
            self.hideShowActivityIndicatorView(show: true, activityIndicatorView: self.activityIndicatorView)
            if let finalUrl = URL(string: "\(APIRoutes.movieAPI)\(homeId)?api_key=\(APIKey.apiKey)"){
                self.getMovie(url: finalUrl) { (movie) in
                    DispatchQueue.main.async {
                        var dynamicSection = HomeSection()
                        dynamicSection.sectionIndex = 0
                        dynamicSection.sectionTitle = ""
                        
                        var arr = [Movie]()
                        arr.append(movie)
                        arr.append(movie)
                        
                        dynamicSection.arrays = arr
                        self.fArray.append(dynamicSection)
                        completionHandler(movie)
                    }
                }
            }
        }else if let id = id{
            if let finalUrl = URL(string: "\(APIRoutes.movieAPI)\(id)?api_key=\(APIKey.apiKey)"){
                self.getMovie(url: finalUrl) { (movie) in
                    DispatchQueue.main.async {
                        completionHandler(movie)
                    }
                }
            }
        }   
    }
    
    func getReviewsByMovieId(completionHandler : @escaping ()->()) {
        self.hideShowActivityIndicatorView(show: true, activityIndicatorView: self.activityIndicatorView)
        if let id = homeMovieObj?.id{
            if let finalUrl = URL(string: "\(APIRoutes.movieAPI)\(id)/reviews?api_key=\(APIKey.apiKey)"){
                self.getReview(url: finalUrl) { (reviews) in
                    if !reviews.isEmpty{
                        var dynamicSection = HomeSection()
                        dynamicSection.sectionIndex = 3
                        dynamicSection.sectionTitle = "Reviews"
                        dynamicSection.arrays = reviews
                        self.fArray.append(dynamicSection)
                    }
                    self.hideShowActivityIndicatorView(show: false, activityIndicatorView: self.activityIndicatorView)
                    completionHandler()
                }
            }
        }
    }
    
    func getCreditsByMovieId(completionHandler : @escaping ()->()) {
        
        self.hideShowActivityIndicatorView(show: true, activityIndicatorView: self.activityIndicatorView)
        
        if let id = homeMovieObj?.id{
            if let finalUrl = URL(string: "\(APIRoutes.movieAPI)\(id)/credits?api_key=\(APIKey.apiKey)"){
                self.getCredits(url: finalUrl) { (credits) in
                                        
                    if let casts = credits.cast,!casts.isEmpty{
                        var dynamicSection = HomeSection()
                        dynamicSection.sectionIndex = 1
                        dynamicSection.sectionTitle = "Cast"
                        dynamicSection.arrays = casts
                        self.fArray.append(dynamicSection)
                    }
                    self.hideShowActivityIndicatorView(show: false, activityIndicatorView: self.activityIndicatorView)
                    completionHandler()
                }
            }
        }
    }
    
    func getRecommendationByMovieId(completionHandler : @escaping ()->()) {
        self.hideShowActivityIndicatorView(show: true, activityIndicatorView: self.activityIndicatorView)
        
        if let id = homeMovieObj?.id{
            if let finalUrl = URL(string: "\(APIRoutes.movieAPI)\(id)/recommendations?api_key=\(APIKey.apiKey)"){
                self.getRecommendedFeed(url: finalUrl) { (movies) in
                                        
                    if !movies.isEmpty{
                        var dynamicSection = HomeSection()
                        dynamicSection.sectionIndex = 2
                        dynamicSection.sectionTitle = "You may also like"
                        dynamicSection.arrays = movies
                        self.fArray.append(dynamicSection)
                    }
                    self.hideShowActivityIndicatorView(show: false, activityIndicatorView: self.activityIndicatorView)
                    completionHandler()
                }
            }
        }
    }
    
    func getPersonById(actorId : Int,completionHandler : @escaping (ActorModel)->()) {
        self.hideShowActivityIndicatorView(show: true, activityIndicatorView: self.activityIndicatorView)
        if let url = URL(string: "\(APIRoutes.personAPI)\(actorId)?api_key=\(APIKey.apiKey)") {
            self.getCastInfoByName(url: url, actorId: actorId) { (actor) in
                self.hideShowActivityIndicatorView(show: false, activityIndicatorView: self.activityIndicatorView)
                completionHandler(actor)
            }
        }
    }
}
