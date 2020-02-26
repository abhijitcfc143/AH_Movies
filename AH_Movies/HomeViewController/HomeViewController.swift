//
//  HomeViewController.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 24/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
            
    var finalArray = [HomeMoviesList]()
    let sectionInsets = UIEdgeInsets(top: 16.0, left: 8.0, bottom: 0.0, right: 4.0)
    let itemsPerRow: CGFloat = 2
    var searchBar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Browse movies"
        search.sizeToFit()
        search.barStyle = .default
        search.translatesAutoresizingMaskIntoConstraints = false
        search.barTintColor = UIColor.darkGray
        search.tintColor = UIColor.white
        search.searchTextField.tintColor = UIColor.white
        search.layer.cornerRadius = 10.0
        search.setImage(UIImage(named: "search"), for: .search, state: .normal)
        
        if let textfield = search.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.white
            textfield.adjustsFontSizeToFitWidth = true
        }
        
        return search
    }()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
}

//MARK:- extension
extension HomeViewController{
    
    func setupUI() {
        self.title = "Movies"
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
        self.setupHomeCollectionViewDelegateAndDatasource()
        self.homeCollectionView.isHidden = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18.0)]
        let image = UIImage.fromColor(UIColor.black)
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.hideShowActivityIndicatorView(show: true, activityIndicatorView: self.activityIndicatorView)
        self.getHomeMovies()
    }
    
    
    func getHomeMovies(){
        if let url = APIRoutes.homeAPI{
            self.getMoviesHomeFeed(url: url) { (movies) in
                DispatchQueue.main.async {
                    self.finalArray.append(contentsOf: movies)
                    self.homeCollectionView.reloadData()
                    self.hideShowActivityIndicatorView(show: false, activityIndicatorView: self.activityIndicatorView)
                    self.homeCollectionView.isHidden = false
                }
            }
        }
    }
}

