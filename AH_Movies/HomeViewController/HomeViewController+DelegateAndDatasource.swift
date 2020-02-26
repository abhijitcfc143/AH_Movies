//
//  HomeViewController+DelegateAndDatasource.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 24/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {

    func setupHomeCollectionViewDelegateAndDatasource(){
        self.homeCollectionView.delegate = self
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.register(UINib(nibName: CollectionViewCellIds.movieCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIds.movieCollectionViewCell)
        self.homeCollectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewCellIds.searchBarCell)
//        let layout = self.homeCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 2)
//        layout.minimumInteritemSpacing = 0
//        layout.itemSize = CGSize(width: 40, height: self.homeCollectionView.frame.height/2.5)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.finalArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.showMovieCollectionViewCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if !self.finalArray.isEmpty{
                self.redirectToMovieDetailViewController(movie: self.finalArray[indexPath.row])
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: self.homeCollectionView.frame.height/2.5)
    }

    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
      
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewCellIds.searchBarCell, for: indexPath)
        headerCell.addSubview(self.searchBar)
//        headerCell.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 8).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: headerCell.trailingAnchor,constant: 0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: headerCell.leadingAnchor,constant: 0).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: headerCell.bottomAnchor,constant: 8).isActive = true
        searchBar.topAnchor.constraint(equalTo: headerCell.topAnchor).isActive = true
        headerCell.layer.cornerRadius = 10.0
        return headerCell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let filteredData = self.finalArray.filter { (homeMovie) -> Bool in
            return homeMovie.title?.range(of: "\(searchBar.text!.trimmingCharacters(in: .whitespaces))") != nil
        }
                
        self.finalArray.removeAll()
        self.finalArray.append(contentsOf: filteredData)
        self.homeCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.finalArray.removeAll()
        self.getHomeMovies()
    }
        
}

//MARK:- RedirectToMovieDetailViewController
extension HomeViewController{
    
    func redirectToMovieDetailViewController(movie : HomeMoviesList) {
        let vc = StoryboardIDs.mainStoryboard.instantiateViewController(identifier: ViewControllerIDs.movieDetailViewController) as! MovieDetailViewController
        vc.homeMovieObj = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
}