//
//  MovieTableViewCell+DelegateAndDatasource.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension MovieCastTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func setupDelegatesAndDatasource(){
        self.castCollectionView.delegate = self
        self.castCollectionView.dataSource = self
        self.castCollectionView.register(UINib(nibName: CollectionViewCellIds.movieCastCharacterCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIds.movieCastCharacterCollectionViewCell)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let castAr = self.castArray,!castAr.isEmpty{
            return castAr.count
        }
        if let moviesAr = self.moviesArray,!moviesAr.isEmpty{
            return moviesAr.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return showMovieCastCharacterCollectionViewCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if let castActorId = self.castArray?[indexPath.row].id{
                NotificationCenter.default.post(name: NSNotification.Name(NotificationNames.castClickedInCollectionView), object: nil, userInfo: ["actorId" : castActorId])
            }else if let movieId = self.moviesArray?[indexPath.row].id{
                NotificationCenter.default.post(name: NSNotification.Name(NotificationNames.movieClickedInCollectionView), object: nil, userInfo: ["movieId" : movieId])
            }
        }        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = self.castCollectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
      
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
        
    
}
